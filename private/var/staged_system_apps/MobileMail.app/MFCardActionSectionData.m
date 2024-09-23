@implementation MFCardActionSectionData

- (MFCardActionSectionData)initWithActions:(id)a3 viewLayout:(int64_t)a4
{
  id v6;
  MFCardActionSectionData *v7;
  NSArray *v8;
  NSArray *actions;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFCardActionSectionData;
  v7 = -[MFCardActionSectionData init](&v11, "init");
  if (v7)
  {
    v8 = (NSArray *)objc_msgSend(v6, "copy");
    actions = v7->_actions;
    v7->_actions = v8;

    v7->_viewLayout = a4;
  }

  return v7;
}

- (NSArray)actions
{
  return self->_actions;
}

- (int64_t)viewLayout
{
  return self->_viewLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
