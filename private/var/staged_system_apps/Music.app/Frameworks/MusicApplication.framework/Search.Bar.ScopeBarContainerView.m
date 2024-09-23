@implementation Search.Bar.ScopeBarContainerView

- (_TtCCC16MusicApplication6Search3BarP33_27F18EE4A78475F0B90E1F3E8DDA223A21ScopeBarContainerView)init
{
  return (_TtCCC16MusicApplication6Search3BarP33_27F18EE4A78475F0B90E1F3E8DDA223A21ScopeBarContainerView *)sub_66CE9C();
}

- (_TtCCC16MusicApplication6Search3BarP33_27F18EE4A78475F0B90E1F3E8DDA223A21ScopeBarContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_66F0D0();
}

- (void)layoutSubviews
{
  _TtCCC16MusicApplication6Search3BarP33_27F18EE4A78475F0B90E1F3E8DDA223A21ScopeBarContainerView *v2;

  v2 = self;
  sub_66D12C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_s3BarC21ScopeBarContainerViewCMa();
  v4 = v8.receiver;
  v5 = a3;
  -[Search.Bar.ScopeBarContainerView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v5);
  v6 = objc_msgSend(v4, "traitCollection", v8.receiver, v8.super_class);
  v7 = objc_msgSend(v6, "horizontalSizeClass");

  if (!v5 || v7 != objc_msgSend(v5, "horizontalSizeClass"))
    objc_msgSend(v4, "setNeedsLayout");

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  _TtCCC16MusicApplication6Search3BarP33_27F18EE4A78475F0B90E1F3E8DDA223A21ScopeBarContainerView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCCC16MusicApplication6Search3BarP33_27F18EE4A78475F0B90E1F3E8DDA223A21ScopeBarContainerView_resultScopeBar);
  v3 = self;
  objc_msgSend(v2, "intrinsicContentSize");
  v5 = v4;
  v7 = v6;
  objc_msgSend(*(id *)((char *)&v3->super.super.super.isa+ OBJC_IVAR____TtCCC16MusicApplication6Search3BarP33_27F18EE4A78475F0B90E1F3E8DDA223A21ScopeBarContainerView_sourceScopeBar), "intrinsicContentSize");
  v9 = v8;
  v11 = v10;

  if (v5 > v9)
    v12 = v5;
  else
    v12 = v9;
  v13 = fmax(v7, 32.0);
  if (v13 <= v11)
    v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtCCC16MusicApplication6Search3BarP33_27F18EE4A78475F0B90E1F3E8DDA223A21ScopeBarContainerView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_66D548(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (_TtCCC16MusicApplication6Search3BarP33_27F18EE4A78475F0B90E1F3E8DDA223A21ScopeBarContainerView)initWithFrame:(CGRect)a3
{
  sub_2EA80C((uint64_t)self, (uint64_t)a2, (uint64_t)"MusicApplication.ScopeBarContainerView", 38);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC16MusicApplication6Search3BarP33_27F18EE4A78475F0B90E1F3E8DDA223A21ScopeBarContainerView_resultScopeBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC16MusicApplication6Search3BarP33_27F18EE4A78475F0B90E1F3E8DDA223A21ScopeBarContainerView_sourceScopeBar));
}

@end
