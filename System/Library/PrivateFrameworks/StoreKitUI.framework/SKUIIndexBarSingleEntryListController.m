@implementation SKUIIndexBarSingleEntryListController

- (SKUIIndexBarSingleEntryListController)initWithEntryViewElement:(id)a3
{
  id v5;
  SKUIIndexBarSingleEntryListController *v6;
  SKUIIndexBarSingleEntryListController *v7;
  objc_super v9;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIndexBarSingleEntryListController initWithEntryViewElement:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIIndexBarSingleEntryListController;
  v6 = -[SKUIIndexBarSingleEntryListController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_entryViewElement, a3);

  return v7;
}

- (id)entryDescriptorAtIndex:(int64_t)a3
{
  return self->_entryDescriptor;
}

- (BOOL)hidesIndexBar
{
  return 0;
}

- (BOOL)needsRootTargetViewElement
{
  return 0;
}

- (int64_t)numberOfEntryDescriptors
{
  return self->_entryDescriptor != 0;
}

- (void)reloadViewElementData
{
  SKUIViewElement *v3;
  SKUIViewElement *descriptiveViewElement;
  SKUIIndexBarEntryDescriptor *v5;
  SKUIIndexBarEntryDescriptor *entryDescriptor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUIIndexBarSingleEntryListController;
  -[SKUIIndexBarEntryListController reloadViewElementData](&v7, sel_reloadViewElementData);
  -[SKUIIndexBarEntryViewElement childElement](self->_entryViewElement, "childElement");
  v3 = (SKUIViewElement *)objc_claimAutoreleasedReturnValue();
  descriptiveViewElement = self->_descriptiveViewElement;
  if (descriptiveViewElement != v3 && (-[SKUIViewElement isEqual:](descriptiveViewElement, "isEqual:", v3) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_descriptiveViewElement, v3);
    -[SKUIIndexBarEntryListController _didInvalidate](self, "_didInvalidate");
  }
  SKUIIndexBarEntryDescriptorForIndexBarEntryViewElement(self->_entryViewElement, self->_descriptiveViewElement);
  v5 = (SKUIIndexBarEntryDescriptor *)objc_claimAutoreleasedReturnValue();
  entryDescriptor = self->_entryDescriptor;
  if (entryDescriptor != v5 && !-[SKUIIndexBarEntryDescriptor isEqual:](entryDescriptor, "isEqual:", v5))
  {
    objc_storeStrong((id *)&self->_entryDescriptor, v5);
    -[SKUIIndexBarEntryListController _didInvalidate](self, "_didInvalidate");
  }

}

- (id)targetIndexBarEntryIDForEntryDescriptorAtIndex:(int64_t)a3 returningRelativeSectionIndex:(int64_t *)a4
{
  if (a4)
    *a4 = 0;
  return -[SKUIIndexBarEntryViewElement targetIndexBarEntryID](self->_entryViewElement, "targetIndexBarEntryID", a3);
}

- (SKUIIndexBarEntryViewElement)entryViewElement
{
  return self->_entryViewElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryViewElement, 0);
  objc_storeStrong((id *)&self->_descriptiveViewElement, 0);
  objc_storeStrong((id *)&self->_entryDescriptor, 0);
}

- (void)initWithEntryViewElement:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIIndexBarSingleEntryListController initWithEntryViewElement:]";
}

@end
