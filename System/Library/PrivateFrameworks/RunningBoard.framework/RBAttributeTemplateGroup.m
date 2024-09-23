@implementation RBAttributeTemplateGroup

- (NSArray)attributes
{
  NSArray *attributes;

  attributes = self->_attributes;
  if (attributes)
    return attributes;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)targetBundleProperties
{
  return self->_targetBundleProperties;
}

- (RBDomainRestriction)restriction
{
  return self->_restriction;
}

- (NSString)description
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  RBDomainRestriction *restriction;
  uint64_t v17;
  NSUInteger v18;
  unint64_t v19;
  void *v20;
  const __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  NSUInteger v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  id v37;
  const __CFString *v38;
  uint64_t v39;
  __CFString *v40;

  v3 = -[RBEntitlementPredicate count](self->_originatorEntitlements, "count");
  v4 = -[RBEntitlementPredicate count](self->_targetEntitlements, "count");
  v5 = -[NSDictionary count](self->_targetBundleProperties, "count");
  v6 = -[NSDictionary count](self->_additionalRestrictions, "count");
  v37 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray componentsJoinedByString:](self->_attributes, "componentsJoinedByString:", CFSTR(",\n\t\t\t\t\t\t"));
  v39 = objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("\n\t\t\t\t\toriginatorEntitlements: ");
  if (!v3)
    v8 = &stru_24DD48378;
  v35 = v8;
  if (v3)
  {
    -[RBEntitlementPredicate description](self->_originatorEntitlements, "description");
    v9 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_24DD48378;
  }
  v10 = CFSTR("\n\t\t\t\t\ttargetEntitlements: ");
  if (!v4)
    v10 = &stru_24DD48378;
  v34 = v10;
  if (v4)
  {
    -[RBEntitlementPredicate description](self->_targetEntitlements, "description");
    v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_24DD48378;
  }
  v12 = CFSTR("\n\t\t\t\t\ttargetBundleProperties:{\n");
  if (!v5)
    v12 = &stru_24DD48378;
  v33 = v12;
  v38 = v9;
  if (v5)
  {
    -[NSDictionary entriesToStringWithIndent:debug:](self->_targetBundleProperties, "entriesToStringWithIndent:debug:", 6, 1);
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v32 = CFSTR("\n\t\t\t\t\t}");
  }
  else
  {
    v32 = &stru_24DD48378;
    v40 = &stru_24DD48378;
  }
  v36 = v11;
  if (v6)
    v13 = CFSTR("\n\t\t\t\t\tadditionalRestrictions:{\n");
  else
    v13 = &stru_24DD48378;
  if (v6)
  {
    -[NSDictionary entriesToStringWithIndent:debug:](self->_additionalRestrictions, "entriesToStringWithIndent:debug:", 6, 1);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("\n\t\t\t\t\t}");
  }
  else
  {
    v15 = &stru_24DD48378;
    v14 = &stru_24DD48378;
  }
  restriction = self->_restriction;
  if (restriction)
  {
    -[RBDomainRestriction description](restriction, "description");
    v17 = objc_claimAutoreleasedReturnValue();
    v31 = v6;
    v18 = v5;
    v19 = v3;
    v20 = (void *)v17;
    v21 = CFSTR("\n\t\t\t\t\t}");
    if (!self->_restriction)
      v21 = &stru_24DD48378;
    v29 = v15;
    v27 = v13;
    v22 = (__CFString *)v36;
    v23 = (__CFString *)v38;
    v24 = (void *)v39;
    v25 = (void *)objc_msgSend(v37, "initWithFormat:", CFSTR("<%@|\n\t\t\t\t\tattributes:[\n\t\t\t\t\t\t%@\n\t\t\t\t\t]%@%@%@%@%@%@%@%@%@%@%@%@%@>"), v7, v39, v35, v38, v34, v36, v33, v40, v32, v27, v14, v29, CFSTR("\n\t\t\t\t\trestrictions:{\n"), v17, v21);

    v3 = v19;
    v5 = v18;
    if (v31)
      goto LABEL_26;
  }
  else
  {
    v30 = v15;
    v28 = v13;
    v22 = (__CFString *)v36;
    v23 = (__CFString *)v38;
    v24 = (void *)v39;
    v25 = (void *)objc_msgSend(v37, "initWithFormat:", CFSTR("<%@|\n\t\t\t\t\tattributes:[\n\t\t\t\t\t\t%@\n\t\t\t\t\t]%@%@%@%@%@%@%@%@%@%@%@%@%@>"), v7, v39, v35, v38, v34, v36, v33, v40, v32, v28, v14, v30, &stru_24DD48378, &stru_24DD48378, &stru_24DD48378);
    if (v6)
LABEL_26:

  }
  if (v5)

  if (v4)
  if (v3)

  return (NSString *)v25;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (void)setTargetBundleProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (RBEntitlementPredicate)originatorEntitlements
{
  return self->_originatorEntitlements;
}

- (void)setOriginatorEntitlements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (RBEntitlementPredicate)targetEntitlements
{
  return self->_targetEntitlements;
}

- (void)setTargetEntitlements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)additionalRestrictions
{
  return self->_additionalRestrictions;
}

- (void)setAdditionalRestrictions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setRestriction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restriction, 0);
  objc_storeStrong((id *)&self->_additionalRestrictions, 0);
  objc_storeStrong((id *)&self->_targetEntitlements, 0);
  objc_storeStrong((id *)&self->_originatorEntitlements, 0);
  objc_storeStrong((id *)&self->_targetBundleProperties, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
