@implementation SBFBSDisplayTransformer

- (SBFBSDisplayTransformer)init
{
  SBFBSDisplayTransformer *v2;
  SBMainDisplayConfigurationTransformer *v3;
  SBMainDisplayConfigurationTransformer *emulatedMainDisplayTransformer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFBSDisplayTransformer;
  v2 = -[SBFBSDisplayTransformer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SBMainDisplayConfigurationTransformer);
    emulatedMainDisplayTransformer = v2->_emulatedMainDisplayTransformer;
    v2->_emulatedMainDisplayTransformer = v3;

  }
  return v2;
}

- (id)transformDisplayConfiguration:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v5 = (void *)MEMORY[0x1E0C99E20];
  v6 = a3;
  objc_msgSend(v5, "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainDisplayConfigurationTransformer transformDisplayConfiguration:](self->_emulatedMainDisplayTransformer, "transformDisplayConfiguration:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFBSDisplayTransformer.m"), 32, CFSTR("received unexpected number of transformed configurations from main display transformer. transformer: %@, result: %@"), self->_emulatedMainDisplayTransformer, v8);

  }
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBDisplayTransformerRegistry sharedInstance](SBDisplayTransformerRegistry, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transformDisplayConfiguration:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v11);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emulatedMainDisplayTransformer, 0);
}

@end
