@implementation _PKProvisioningRequirementOracle

- (_PKProvisioningRequirementOracle)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProvisioningRequirementOracle();
  return -[_PKProvisioningRequirementOracle init](&v3, sel_init);
}

- (id)requirementsForAddSecureElementPassConfiguration:(id)a3
{
  id v4;
  _PKProvisioningRequirementOracle *v5;
  char *v6;
  char *v7;
  objc_class *v8;
  char *v9;
  char *v10;
  _PKProvisioningRequirementOracle *v11;
  id v12;
  objc_super v14;

  v4 = a3;
  v5 = self;
  v6 = sub_18FE2699C(v4);
  v7 = sub_18FE23F3C((uint64_t)v6);
  swift_bridgeObjectRelease();
  v8 = (objc_class *)type metadata accessor for ProvisioningRequirementsContainer();
  v9 = (char *)objc_allocWithZone(v8);
  v10 = &v9[OBJC_IVAR____PKProvisioningRequirementsContainer_provisioningSID];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  *(_QWORD *)&v9[OBJC_IVAR____PKProvisioningRequirementsContainer_requirements] = v7;
  v14.receiver = v9;
  v14.super_class = v8;
  v11 = -[_PKProvisioningRequirementOracle init](&v14, sel_init);
  v12 = objc_msgSend(objc_allocWithZone((Class)PKProvisioningRequirementsContainer), sel_initWithContainer_, v11);

  return v12;
}

- (id)recoverableRequirementsContainer
{
  objc_class *v3;
  char *v4;
  char *v5;
  _PKProvisioningRequirementOracle *v6;
  _PKProvisioningRequirementOracle *v7;
  id v8;
  id v9;
  objc_super v11;

  v3 = (objc_class *)type metadata accessor for ProvisioningRequirementsContainer();
  v4 = (char *)objc_allocWithZone(v3);
  v5 = &v4[OBJC_IVAR____PKProvisioningRequirementsContainer_provisioningSID];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  *(_QWORD *)&v4[OBJC_IVAR____PKProvisioningRequirementsContainer_requirements] = &unk_1E2AA9130;
  v11.receiver = v4;
  v11.super_class = v3;
  v6 = self;
  v7 = -[_PKProvisioningRequirementOracle init](&v11, sel_init);
  v8 = objc_allocWithZone((Class)PKProvisioningRequirementsContainer);
  v9 = objc_msgSend(v8, sel_initWithContainer_, v7, v11.receiver, v11.super_class);

  return v9;
}

@end
