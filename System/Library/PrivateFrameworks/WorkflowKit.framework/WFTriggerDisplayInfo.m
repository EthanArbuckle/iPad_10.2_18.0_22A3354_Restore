@implementation WFTriggerDisplayInfo

- (WFTriggerDisplayInfo)initWithLocalizedTitle:(id)a3 localizedDescription:(id)a4 actionIcons:(id)a5 triggerClass:(Class)a6
{
  id v11;
  id v12;
  id v13;
  WFTriggerDisplayInfo *v14;
  WFTriggerDisplayInfo *v15;
  WFTriggerDisplayInfo *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFTriggerDisplayInfo;
  v14 = -[WFTriggerDisplayInfo init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_localizedTitle, a3);
    objc_storeStrong((id *)&v15->_localizedDescription, a4);
    objc_storeStrong((id *)&v15->_actionIcons, a5);
    objc_storeStrong((id *)&v15->_triggerClass, a6);
    v16 = v15;
  }

  return v15;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (NSArray)actionIcons
{
  return self->_actionIcons;
}

- (Class)triggerClass
{
  return self->_triggerClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerClass, 0);
  objc_storeStrong((id *)&self->_actionIcons, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
