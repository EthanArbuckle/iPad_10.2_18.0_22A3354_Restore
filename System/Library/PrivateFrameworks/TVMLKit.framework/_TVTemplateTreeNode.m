@implementation _TVTemplateTreeNode

- (_TVTemplateTreeNode)initWithTemplateName:(id)a3 styleSheetURLs:(id)a4 abstract:(BOOL)a5
{
  id v8;
  id v9;
  _TVTemplateTreeNode *v10;
  uint64_t v11;
  NSString *templateName;
  uint64_t v13;
  NSArray *styleSheetURLs;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_TVTemplateTreeNode;
  v10 = -[_TVTemplateTreeNode init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    templateName = v10->_templateName;
    v10->_templateName = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    styleSheetURLs = v10->_styleSheetURLs;
    v10->_styleSheetURLs = (NSArray *)v13;

    v10->_isAbstract = a5;
  }

  return v10;
}

- (NSString)templateName
{
  return self->_templateName;
}

- (NSArray)styleSheetURLs
{
  return self->_styleSheetURLs;
}

- (void)setFinalURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isAbstract
{
  return self->_isAbstract;
}

- (NSArray)derivedTemplateNodes
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_derivedTemplateNodes, "copy");
}

- (_TVTemplateTreeNode)initWithTemplateName:(id)a3 styleSheetURLs:(id)a4
{
  return -[_TVTemplateTreeNode initWithTemplateName:styleSheetURLs:abstract:](self, "initWithTemplateName:styleSheetURLs:abstract:", a3, a4, 0);
}

- (void)addDerivedTemplateNode:(id)a3
{
  id v4;
  NSMutableArray *derivedTemplateNodes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  derivedTemplateNodes = self->_derivedTemplateNodes;
  v8 = v4;
  if (!derivedTemplateNodes)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_derivedTemplateNodes;
    self->_derivedTemplateNodes = v6;

    v4 = v8;
    derivedTemplateNodes = self->_derivedTemplateNodes;
  }
  -[NSMutableArray addObject:](derivedTemplateNodes, "addObject:", v4);

}

- (NSArray)finalURLs
{
  return self->_finalURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalURLs, 0);
  objc_storeStrong((id *)&self->_styleSheetURLs, 0);
  objc_storeStrong((id *)&self->_templateName, 0);
  objc_storeStrong((id *)&self->_derivedTemplateNodes, 0);
}

@end
