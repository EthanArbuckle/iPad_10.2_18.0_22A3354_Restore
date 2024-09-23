@implementation REMTTParagraphStyle

- (REMTTParagraphStyle)initWithContents:(id)a3
{
  id v4;
  REMTTParagraphStyle *v5;
  uint64_t v6;
  uint64_t v7;
  TTParagraphStyle *innerStyle;
  REMTTParagraphStyle *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REMTTParagraphStyle;
  v5 = -[REMTTParagraphStyle init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    REMDynamicCast(v6, (uint64_t)v4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v9 = 0;
      goto LABEL_6;
    }
    innerStyle = v5->_innerStyle;
    v5->_innerStyle = (TTParagraphStyle *)v7;

  }
  v9 = v5;
LABEL_6:

  return v9;
}

- (REMTTParagraphStyle)initWithStyle:(int64_t)a3
{
  REMTTParagraphStyle *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)REMTTParagraphStyle;
  v4 = -[REMTTParagraphStyle init](&v9, sel_init);
  if (v4)
  {
    switch(a3)
    {
      case 1:
        v6 = 100;
        goto LABEL_7;
      case 2:
        v6 = 101;
        goto LABEL_7;
      case 3:
        v6 = 102;
LABEL_7:
        +[TTParagraphStyle paragraphStyleNamed:](TTParagraphStyle, "paragraphStyleNamed:", v6);
        v5 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        +[TTParagraphStyle defaultParagraphStyle](TTParagraphStyle, "defaultParagraphStyle");
        v5 = objc_claimAutoreleasedReturnValue();
        break;
    }
    v7 = (void *)v5;
    -[REMTTParagraphStyle setInnerStyle:](v4, "setInnerStyle:", v5);

  }
  return v4;
}

- (int64_t)remParagraphStyle
{
  void *v2;
  int v3;
  uint64_t v4;

  -[REMTTParagraphStyle innerStyle](self, "innerStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "style");

  v4 = (v3 - 100);
  if (v4 < 3)
    return v4 + 1;
  else
    return 0;
}

- (id)listBulletInAttributedString:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[REMTTParagraphStyle innerStyle](self, "innerStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "listBulletInAttributedString:atIndex:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (TTParagraphStyle)innerStyle
{
  return self->_innerStyle;
}

- (void)setInnerStyle:(id)a3
{
  objc_storeStrong((id *)&self->_innerStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerStyle, 0);
}

@end
