@implementation OCXRelationship

- (OCXRelationship)initWithId:(unint64_t)a3 type:(id)a4 target:(id)a5 external:(BOOL)a6
{
  id v11;
  id v12;
  OCXRelationship *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSString *mIdString;
  objc_super v20;

  v11 = a4;
  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)OCXRelationship;
  v13 = -[OCXRelationship init](&v20, sel_init);
  if (v13)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", a3);
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v14, "stringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("rId%@"), v16);
    mIdString = v13->mIdString;
    v13->mIdString = (NSString *)v17;

    objc_storeStrong((id *)&v13->mType, a4);
    objc_storeStrong((id *)&v13->mTarget, a5);
    v13->mExternal = a6;

  }
  return v13;
}

- (void)writeToStreamWriter:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "startPlainElement:", CFSTR("Relationship"));
  objc_msgSend(v4, "writePlainAttribute:content:", CFSTR("Id"), self->mIdString);
  objc_msgSend(v4, "writePlainAttribute:content:", CFSTR("Type"), self->mType);
  objc_msgSend(v4, "writePlainAttribute:content:", CFSTR("Target"), self->mTarget);
  if (self->mExternal)
    objc_msgSend(v4, "writePlainAttribute:content:", CFSTR("TargetMode"), CFSTR("External"));
  objc_msgSend(v4, "endElement");

}

- (NSString)idString
{
  return self->mIdString;
}

- (NSString)type
{
  return self->mType;
}

- (NSString)target
{
  return self->mTarget;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTarget, 0);
  objc_storeStrong((id *)&self->mType, 0);
  objc_storeStrong((id *)&self->mIdString, 0);
}

@end
