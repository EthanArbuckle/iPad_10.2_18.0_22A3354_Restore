@implementation SiriUIBaseTemplateView

- (SiriUIBaseTemplateView)initWithDataSource:(id)a3
{
  id v4;
  SiriUIBaseTemplateView *v5;
  SiriUIBaseTemplateView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SiriUIBaseTemplateView;
  v5 = -[SiriUIBaseTemplateView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_dataSource, v4);

  return v6;
}

- (double)desiredHeight
{
  return 0.0;
}

- (void)removeFromTemplatedSuperview
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_templatedSuperview);
  objc_msgSend(WeakRetained, "templateSubviewWantsToBeRemovedFromHierarchy:", self);

}

- (SiriUITemplatedView)templatedSuperview
{
  return (SiriUITemplatedView *)objc_loadWeakRetained((id *)&self->_templatedSuperview);
}

- (void)setTemplatedSuperview:(id)a3
{
  objc_storeWeak((id *)&self->_templatedSuperview, a3);
}

- (SiriUITemplateModel)dataSource
{
  return (SiriUITemplateModel *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_templatedSuperview);
}

@end
