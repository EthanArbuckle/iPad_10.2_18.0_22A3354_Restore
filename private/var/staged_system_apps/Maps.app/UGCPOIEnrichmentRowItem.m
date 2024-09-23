@implementation UGCPOIEnrichmentRowItem

- (UGCPOIEnrichmentRowItem)initWithView:(id)a3 bottomSpacing:(double)a4
{
  id v7;
  UGCPOIEnrichmentRowItem *v8;
  UGCPOIEnrichmentRowItem *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UGCPOIEnrichmentRowItem;
  v8 = -[UGCPOIEnrichmentRowItem init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_rowView, a3);
    v9->_bottomSpacing = a4;
  }

  return v9;
}

+ (id)rowItemWithView:(id)a3
{
  id v3;
  UGCPOIEnrichmentRowItem *v4;

  v3 = a3;
  v4 = -[UGCPOIEnrichmentRowItem initWithView:bottomSpacing:]([UGCPOIEnrichmentRowItem alloc], "initWithView:bottomSpacing:", v3, 0.0);

  return v4;
}

+ (id)rowItemWithView:(id)a3 bottomSpacing:(double)a4
{
  id v5;
  UGCPOIEnrichmentRowItem *v6;

  v5 = a3;
  v6 = -[UGCPOIEnrichmentRowItem initWithView:bottomSpacing:]([UGCPOIEnrichmentRowItem alloc], "initWithView:bottomSpacing:", v5, a4);

  return v6;
}

- (UIView)rowView
{
  return self->_rowView;
}

- (double)bottomSpacing
{
  return self->_bottomSpacing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowView, 0);
}

@end
