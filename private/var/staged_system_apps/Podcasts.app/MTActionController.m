@implementation MTActionController

- (void)setColorTheme:(id)a3
{
  MTColorTheme *v5;
  MTColorTheme *colorTheme;
  unsigned __int8 v7;
  MTColorTheme *v8;

  v5 = (MTColorTheme *)a3;
  colorTheme = self->_colorTheme;
  if (colorTheme != v5)
  {
    v8 = v5;
    v7 = -[MTColorTheme isEqual:](colorTheme, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_colorTheme, a3);
      -[MTActionController setupActions](self, "setupActions");
      v5 = v8;
    }
  }

}

- (void)setAvailableActions:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTActionController;
  -[IMActionController setAvailableActions:](&v4, "setAvailableActions:", a3);
  -[MTActionController setupActions](self, "setupActions");
}

- (void)setupActions
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionController availableActions](self, "availableActions"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005ED9C;
  v4[3] = &unk_1004A6E10;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

- (id)createMoreAction
{
  return +[MTMoreActionSheetAction action](MTMoreActionSheetAction, "action");
}

- (MTColorTheme)colorTheme
{
  return self->_colorTheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorTheme, 0);
}

@end
