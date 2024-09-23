@implementation CHDScatterSeries

- (void)setCategoryData:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CHDScatterSeries;
  -[CHDSeries setCategoryData:](&v7, sel_setCategoryData_, v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super.mChart);
  objc_msgSend(WeakRetained, "processors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markObject:processor:", v4, objc_opt_class());

}

- (id)categoryData
{
  return self->super.super.mCategoryData;
}

@end
