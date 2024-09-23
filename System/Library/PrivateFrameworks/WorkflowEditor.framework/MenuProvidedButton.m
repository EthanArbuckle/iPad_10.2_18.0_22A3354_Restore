@implementation MenuProvidedButton

- (CGSize)intrinsicContentSize
{
  _TtC14WorkflowEditor18MenuProvidedButton *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_226797E60();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC14WorkflowEditor18MenuProvidedButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2267994F8();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtC14WorkflowEditor18MenuProvidedButton *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_226799584();

  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC14WorkflowEditor18MenuProvidedButton *v6;

  v5 = a3;
  v6 = self;
  sub_226799834(a3);

}

- (_TtC14WorkflowEditor18MenuProvidedButton)initWithFrame:(CGRect)a3
{
  sub_226799948();
}

- (void).cxx_destruct
{
  sub_22669DFD4((uint64_t)self + OBJC_IVAR____TtC14WorkflowEditor18MenuProvidedButton_menuProvider);
}

@end
