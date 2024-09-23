@implementation REMTemplateSectionContext

- (REMTemplateSectionContext)initWithParentTemplate:(id)a3
{
  id v5;
  REMTemplateSectionContext *v6;
  REMTemplateSectionContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMTemplateSectionContext;
  v6 = -[REMTemplateSectionContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_parentTemplate, a3);

  return v7;
}

- (REMTemplate)parentTemplate
{
  return self->_parentTemplate;
}

- (void)setParentTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_parentTemplate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentTemplate, 0);
}

@end
