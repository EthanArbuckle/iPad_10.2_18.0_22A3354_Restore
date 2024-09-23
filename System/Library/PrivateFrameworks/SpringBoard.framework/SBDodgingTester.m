@implementation SBDodgingTester

- (SBDodgingTester)initWithDodgingResolverController:(id)a3
{
  id v4;
  SBDodgingTester *v5;
  void *v6;
  uint64_t v7;
  PTSingleTestRecipe *testRecipe;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBDodgingTester;
  v5 = -[SBDodgingTester init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D830E8];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__SBDodgingTester_initWithDodgingResolverController___block_invoke;
    v10[3] = &unk_1E8E9DED8;
    v11 = v4;
    objc_msgSend(v6, "recipeWithTitle:action:", CFSTR("Add Dodging Item"), v10);
    v7 = objc_claimAutoreleasedReturnValue();
    testRecipe = v5->_testRecipe;
    v5->_testRecipe = (PTSingleTestRecipe *)v7;

    +[PTDomain registerTestRecipe:](SBAppSwitcherDomain, "registerTestRecipe:", v5->_testRecipe);
  }

  return v5;
}

void __53__SBDodgingTester_initWithDodgingResolverController___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SBDodgingTesterView *v19;
  void *v20;
  void *v21;
  _QWORD v23[11];

  v23[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v21;
  objc_msgSend(MEMORY[0x1E0CEA478], "orangeColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v1;
  objc_msgSend(MEMORY[0x1E0CEA478], "purpleColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v2;
  objc_msgSend(MEMORY[0x1E0CEA478], "blueColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v3;
  objc_msgSend(MEMORY[0x1E0CEA478], "yellowColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v4;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemPinkColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v5;
  objc_msgSend(MEMORY[0x1E0CEA478], "brownColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v6;
  objc_msgSend(MEMORY[0x1E0CEA478], "magentaColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v7;
  objc_msgSend(MEMORY[0x1E0CEA478], "cyanColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[8] = v8;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemDarkGreenColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[9] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 10);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = arc4random();
  v12 = v11 % objc_msgSend(v10, "count");
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(&unk_1E91CF538, "objectAtIndexedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "substringWithRange:", 0, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@-%@"), v14, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = [SBDodgingTesterView alloc];
  objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

}

- (PTSingleTestRecipe)testRecipe
{
  return self->_testRecipe;
}

- (void)setTestRecipe:(id)a3
{
  objc_storeStrong((id *)&self->_testRecipe, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testRecipe, 0);
}

@end
