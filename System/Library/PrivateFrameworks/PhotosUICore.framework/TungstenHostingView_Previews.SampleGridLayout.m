@implementation TungstenHostingView_Previews.SampleGridLayout

- (_TtCV12PhotosUICore28TungstenHostingView_PreviewsP33_548AEEF075E30F02ECF115384DCAC70916SampleGridLayout)init
{
  _TtCV12PhotosUICore28TungstenHostingView_PreviewsP33_548AEEF075E30F02ECF115384DCAC70916SampleGridLayout *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TungstenHostingView_Previews.SampleGridLayout();
  v2 = -[PXGGridLayout init](&v4, sel_init);
  -[PXGGridLayout setNumberOfColumns:](v2, sel_setNumberOfColumns_, 50);
  -[PXGItemsLayout setNumberOfItems:](v2, sel_setNumberOfItems_, 5000);
  -[PXGGridLayout setMediaKind:](v2, sel_setMediaKind_, 5);
  -[PXGLayout setContentSource:](v2, sel_setContentSource_, v2);

  return v2;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return objc_msgSend((id)objc_opt_self(), sel_purpleColor);
}

@end
