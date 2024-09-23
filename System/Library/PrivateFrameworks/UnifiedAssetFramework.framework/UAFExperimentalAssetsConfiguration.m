@implementation UAFExperimentalAssetsConfiguration

+ (BOOL)isValid:(id)a3 error:(id *)a4
{
  id v5;
  BOOL v6;

  v5 = a3;
  v6 = +[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v5, CFSTR("TrialProject"), objc_opt_class(), 1, a4)&& +[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v5, CFSTR("TrialNamespace"), objc_opt_class(), 1, a4)&& +[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v5,
         CFSTR("TrialFactor"),
         objc_opt_class(),
         1,
         a4);

  return v6;
}

- (UAFExperimentalAssetsConfiguration)initWithDictionary:(id)a3
{
  id v4;
  UAFExperimentalAssetsConfiguration *v5;
  uint64_t v6;
  NSString *trialProject;
  uint64_t v8;
  NSString *trialNamespace;
  uint64_t v10;
  NSString *trialFactor;
  UAFExperimentalAssetsConfiguration *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UAFExperimentalAssetsConfiguration;
  v5 = -[UAFExperimentalAssetsConfiguration init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TrialProject"));
    v6 = objc_claimAutoreleasedReturnValue();
    trialProject = v5->_trialProject;
    v5->_trialProject = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TrialNamespace"));
    v8 = objc_claimAutoreleasedReturnValue();
    trialNamespace = v5->_trialNamespace;
    v5->_trialNamespace = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TrialFactor"));
    v10 = objc_claimAutoreleasedReturnValue();
    trialFactor = v5->_trialFactor;
    v5->_trialFactor = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (NSString)trialProject
{
  return self->_trialProject;
}

- (void)setTrialProject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)trialNamespace
{
  return self->_trialNamespace;
}

- (void)setTrialNamespace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)trialFactor
{
  return self->_trialFactor;
}

- (void)setTrialFactor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialFactor, 0);
  objc_storeStrong((id *)&self->_trialNamespace, 0);
  objc_storeStrong((id *)&self->_trialProject, 0);
}

@end
