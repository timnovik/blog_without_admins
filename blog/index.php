<head><link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></head>
<?php
    $connection = mysqli_connect('127.0.0.1', 'root', '');
    mysqli_select_db($connection, 'blog');
    mysqli_set_charset($connection, 'utf8');
    echo "<h1>Superblog</h1><a href='http://localhost:8080/index.php' style='font-size: 14px'>Mainpage</a><hr>";
if (isset($_GET["post"]) and $_GET["post"] != "new"){
    if (isset($_POST["text"]) && isset($_POST["email"]) && $_POST["text"] != '' && $_POST["email"] != '') {
        $my_comment = mysqli_query($connection,'INSERT INTO comments (email, text, post_id) VALUES ("'.htmlspecialchars(str_replace('DELETE', '', str_replace('DROP', '',$_POST["email"].'", "'.$_POST["text"].'", "'.$_GET["post"].'")'))));
};
    $query_result = mysqli_query($connection, 'SELECT * FROM comments WHERE post_id = ' . str_replace('DELETE', '', str_replace('DROP', '', $_GET["post"])));
    $comments = mysqli_fetch_all($query_result);
    $post_result = mysqli_query($connection, 'SELECT * FROM posts WHERE id = ' . str_replace('DELETE', '', str_replace('DROP', '', $_GET["post"])));
    $posts = mysqli_fetch_all($post_result);
    $post = $posts[0];
    echo "<p style='font-size: 25px'><b>".$post[1]."</b></p><p style='font-size: 20px'><em>" . "by" . " " . $post[4]."</em></h2></p><br><p style='font-size: 17px'>".wordwrap($post[2], 100, "<br>", true)."</p><hr>";
    echo '<ul>';
    foreach ($comments as $comment)
    {
        echo '<li>'.$comment[1].', '.$comment[3].': '.$comment[2].'</li>';
    }
    echo '</ul>';
    echo "<form action='index.php?post=".$_GET["post"]."' method='post'>
 <input type='text' name='email'>nickname<br><br></input>
  <input type='text' name='text'>text<br><br></input>
  <input type='submit' value='add comment' />
";} elseif (!isset($_GET["post"])) {
    $posts = mysqli_query($connection, 'SELECT * FROM posts');
    foreach ($posts as $post) {
        echo "<a class='btn btn-default btn-block' href='index.php/?post=".$post["id"]."' role='button' style='text-align: left'>".$post["name"]."<br><em>"."by"." ".$post["author"]."</em><br>".wordwrap(substr($post["text"], 0, 200), 100, "<br>", true)."</a>";
        // echo "<a href='http://localhost:8080/blog/index.php?post=".$post["id"]."' style='font-size: 20px'>".$post["name"] . "<br><em>" . "by" . " " . $post["author"]."</em></h2></a><br><p>".substr($post["text"], 0, 100)."<br>".substr($post["text"], 100, 100)."</p><hr>";
    }
    echo "<h2>new post</h2><form action='index.php/?post=new' method='post'>
  <div class=\"form-group\">
    <label for=\"exampleInputNickname\">Nickname</label>
    <input type=\"text\" name='author' class=\"form-control\" id=\"exampleInputNickname\" placeholder=\"Nickname\">
  </div>
  <div class=\"form - group\">
    <label for=\"exampleInputHeader\">Header</label>
    <input type=\"text\" name='name' class=\"form-control\" id=\"exampleInputHeader\" placeholder=\"Header\">
  </div>
 <div class=\"form - group\">
    <label for=\"exampleInputText\">Text</label>
    <input type=\"text\" name='text' class=\"form-control\" id=\"exampleInputText\" placeholder=\"Text\">
  </div>
  <button type=\"submit\" class=\"btn btn-default\">Submit</button>
</form>";
} elseif ($_GET["post"] == "new" and isset($_POST["author"]) and isset($_POST["name"]) and isset($_POST["text"]) and $_POST["author"] != "" and $_POST["name"] != "" and $_POST["text"] != "") {
    $my_comment = mysqli_query($connection, 'INSERT INTO posts (name, text, author) VALUES ("'.htmlspecialchars(str_replace('DELETE', '', str_replace('DROP', '',$_POST["name"].'", "'.$_POST["text"].'", "'.$_POST["author"].'")'))));
}

