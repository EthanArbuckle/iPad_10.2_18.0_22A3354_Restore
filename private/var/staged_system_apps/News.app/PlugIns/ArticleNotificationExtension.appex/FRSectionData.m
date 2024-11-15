@implementation FRSectionData

- (FRSectionData)initWithName:(id)a3
{
  id v5;
  FRSectionData *v6;
  FRSectionData *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FRSectionData;
  v6 = -[FRSectionData init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sectionName, a3);

  return v7;
}

- (NSString)sectionName
{
  return self->_sectionName;
}

- (void)setSectionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionName, 0);
}

@end
