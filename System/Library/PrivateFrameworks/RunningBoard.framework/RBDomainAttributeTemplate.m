@implementation RBDomainAttributeTemplate

- (uint64_t)endowmentNamespace
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

- (RBDomainRestriction)restriction
{
  return self->_restriction;
}

- (NSDictionary)targetBundleProperties
{
  return self->_targetBundleProperties;
}

- (NSDictionary)additionalRestrictions
{
  return self->_additionalRestrictions;
}

- (RBEntitlementPredicate)targetEntitlements
{
  return self->_targetEntitlements;
}

- (RBEntitlementPredicate)originatorEntitlements
{
  return self->_originatorEntitlements;
}

- (NSArray)attributeGroups
{
  NSArray *attributeGroups;

  attributeGroups = self->_attributeGroups;
  if (attributeGroups)
    return attributeGroups;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)description
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSString *endowmentNamespace;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  __CFString *v15;
  const __CFString *v16;
  NSUInteger v17;
  RBDomainRestriction *restriction;
  const __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  __CFString *v30;
  NSString *name;
  NSString *domain;
  id v33;
  __CFString *v34;
  NSUInteger v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  __CFString *v39;

  v3 = -[RBEntitlementPredicate count](self->_originatorEntitlements, "count");
  v4 = -[RBEntitlementPredicate count](self->_targetEntitlements, "count");
  v5 = -[NSDictionary count](self->_targetBundleProperties, "count");
  v6 = -[NSDictionary count](self->_additionalRestrictions, "count");
  v33 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  domain = self->_domain;
  endowmentNamespace = self->_endowmentNamespace;
  v8 = CFSTR(" endowmentNamespace:");
  v9 = &stru_24DD48378;
  if (!endowmentNamespace)
    v8 = &stru_24DD48378;
  v29 = v8;
  if (endowmentNamespace)
    v10 = (const __CFString *)self->_endowmentNamespace;
  else
    v10 = &stru_24DD48378;
  v11 = CFSTR("\n\t\t\toriginatorEntitlements: ");
  if (!v3)
    v11 = &stru_24DD48378;
  v27 = v11;
  v28 = v10;
  v38 = v3;
  if (v3)
  {
    -[RBEntitlementPredicate description](self->_originatorEntitlements, "description");
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = &stru_24DD48378;
  }
  v12 = CFSTR("\n\t\t\ttargetEntitlements: ");
  if (!v4)
    v12 = &stru_24DD48378;
  v26 = v12;
  if (v4)
  {
    -[RBEntitlementPredicate description](self->_targetEntitlements, "description");
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = &stru_24DD48378;
  }
  v13 = CFSTR("\n\t\t\ttargetBundleProperties:{\n");
  if (!v5)
    v13 = &stru_24DD48378;
  v25 = v13;
  if (v5)
  {
    -[NSDictionary entriesToStringWithIndent:debug:](self->_targetBundleProperties, "entriesToStringWithIndent:debug:", 4, 1);
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v24 = CFSTR("\t\t\t}");
  }
  else
  {
    v24 = &stru_24DD48378;
    v39 = &stru_24DD48378;
  }
  if (v6)
    v14 = CFSTR("\n\t\t\tadditionalRestrictions:{\n");
  else
    v14 = &stru_24DD48378;
  v37 = v4;
  v35 = v6;
  if (v6)
  {
    -[NSDictionary entriesToStringWithIndent:debug:](self->_additionalRestrictions, "entriesToStringWithIndent:debug:", 4, 1);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("\t\t\t}");
  }
  else
  {
    v16 = &stru_24DD48378;
    v15 = &stru_24DD48378;
  }
  v17 = v5;
  restriction = self->_restriction;
  if (restriction)
    v19 = CFSTR("\n\t\t\t\t\trestrictions:{\n");
  else
    v19 = &stru_24DD48378;
  if (restriction)
  {
    -[RBDomainRestriction description](self->_restriction, "description");
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (self->_restriction)
      v9 = CFSTR("\n\t\t\t\t\t}");
  }
  else
  {
    v20 = &stru_24DD48378;
  }
  -[NSArray componentsJoinedByString:](self->_attributeGroups, "componentsJoinedByString:", CFSTR(",\n\t\t\t\t"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v33, "initWithFormat:", CFSTR("<%@| domain:%@ name:%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@\n\t\t\tattributeGroups:[\n\t\t\t\t%@\n\t\t\t]>"), v36, domain, name, v29, v28, v27, v34, v26, v30, v25, v39, v24, v14, v15, v16, v19,
                  v20,
                  v9,
                  v21);

  if (restriction)
  if (v35)

  if (v17)
  if (v37)

  if (v38)
  return (NSString *)v22;
}

- (void)setAttributeGroups:(id)a3
{
  objc_storeStrong((id *)&self->_attributeGroups, a3);
}

- (uint64_t)domain
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void)setDomain:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 16);
}

- (uint64_t)name
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (void)setName:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 24);
}

- (void)setOriginatorEntitlements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setTargetBundleProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setTargetEntitlements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setAdditionalRestrictions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setRestriction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setEndowmentNamespace:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endowmentNamespace, 0);
  objc_storeStrong((id *)&self->_restriction, 0);
  objc_storeStrong((id *)&self->_additionalRestrictions, 0);
  objc_storeStrong((id *)&self->_targetEntitlements, 0);
  objc_storeStrong((id *)&self->_targetBundleProperties, 0);
  objc_storeStrong((id *)&self->_originatorEntitlements, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_attributeGroups, 0);
}

@end
