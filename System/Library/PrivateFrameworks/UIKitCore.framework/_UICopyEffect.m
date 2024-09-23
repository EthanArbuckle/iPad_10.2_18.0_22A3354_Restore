@implementation _UICopyEffect

+ (id)copyEffectWithCaptureGroup:(id)a3
{
  id v4;
  id *v5;

  v4 = a3;
  if (v4)
  {
    v5 = (id *)objc_opt_new();
    objc_msgSend(v4, "setDisableInPlaceFiltering:", 1);
    objc_storeStrong(v5 + 1, a3);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "setRequirements:", 2);
  objc_msgSend(v7, "setCaptureGroup:", self->_captureGroup);
  objc_msgSend(v6, "addUnderlay:", v7);

}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICopyEffect.m"), 38, CFSTR("_UICopyEffect is not codable"));

}

- (int64_t)_expectedUsage
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UICopyEffect;
  -[_UICopyEffect description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" captureGroup=%@"), self->_captureGroup);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureGroup, 0);
}

@end
