@implementation PUCopyEditsSettingSection

- (PUCopyEditsSettingSection)initWithItems:(id)a3 header:(id)a4 footer:(id)a5
{
  id v9;
  id v10;
  id v11;
  PUCopyEditsSettingSection *v12;
  PUCopyEditsSettingSection *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PUCopyEditsSettingSection;
  v12 = -[PUCopyEditsSettingSection init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_items, a3);
    objc_storeStrong((id *)&v13->_header, a4);
    objc_storeStrong((id *)&v13->_footer, a5);
  }

  return v13;
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_storeStrong((id *)&self->_footer, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

@end
