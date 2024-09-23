@implementation SizedToLabelButton

- (CGSize)intrinsicContentSize
{
  _TtC16MusicApplicationP33_DAB54CA7D29920EBBFDD710D11133BE818SizedToLabelButton *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v2 = self;
  v3 = -[SizedToLabelButton titleLabel](v2, "titleLabel");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "intrinsicContentSize");
    v6 = v5;
    v8 = v7;

  }
  else
  {

    v8 = 0.0;
    v6 = 0.0;
  }
  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC16MusicApplicationP33_DAB54CA7D29920EBBFDD710D11133BE818SizedToLabelButton)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplicationP33_DAB54CA7D29920EBBFDD710D11133BE818SizedToLabelButton *)sub_6F9CA8(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for SizedToLabelButton);
}

- (_TtC16MusicApplicationP33_DAB54CA7D29920EBBFDD710D11133BE818SizedToLabelButton)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplicationP33_DAB54CA7D29920EBBFDD710D11133BE818SizedToLabelButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SizedToLabelButton();
  v4 = a3;
  v5 = -[SizedToLabelButton initWithCoder:](&v7, "initWithCoder:", v4);

  return v5;
}

@end
