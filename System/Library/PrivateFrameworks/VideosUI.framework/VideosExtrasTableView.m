@implementation VideosExtrasTableView

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  -[VideosExtrasTableView indexPathForSelectedRow](self, "indexPathForSelectedRow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)VideosExtrasTableView;
  -[VideosExtrasTableView touchesBegan:withEvent:](&v10, sel_touchesBegan_withEvent_, v7, v6);

  if (v8)
  {
    -[VideosExtrasTableView cellForRowAtIndexPath:](self, "cellForRowAtIndexPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSelected:animated:", 1, 0);

  }
}

@end
