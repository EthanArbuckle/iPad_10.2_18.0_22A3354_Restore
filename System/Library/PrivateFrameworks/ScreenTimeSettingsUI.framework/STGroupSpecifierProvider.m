@implementation STGroupSpecifierProvider

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalid)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STGroupSpecifierProvider.m"), 26, CFSTR("%@ must be invalidated before deallocing"), self);

  }
  v5.receiver = self;
  v5.super_class = (Class)STGroupSpecifierProvider;
  -[STGroupSpecifierProvider dealloc](&v5, sel_dealloc);
}

- (STGroupSpecifierProvider)init
{
  STGroupSpecifierProvider *v2;
  STGroupSpecifierProvider *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  PSSpecifier *groupSpecifier;
  uint64_t v8;
  NSMutableArray *privateSpecifiers;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)STGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BE75590];
    -[STGroupSpecifierProvider description](v2, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupSpecifierWithID:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    groupSpecifier = v3->_groupSpecifier;
    v3->_groupSpecifier = (PSSpecifier *)v6;

    v8 = objc_opt_new();
    privateSpecifiers = v3->_privateSpecifiers;
    v3->_privateSpecifiers = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, sel__tableCellHeightDidChange_, 0x24DB927F0, 0);

  }
  return v3;
}

+ (BOOL)automaticallyNotifiesObserversOfIsHidden
{
  return 0;
}

- (void)setIsHidden:(BOOL)a3
{
  if (self->_isHidden != a3)
  {
    -[STGroupSpecifierProvider willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isHidden"));
    self->_isHidden = a3;
    -[STGroupSpecifierProvider didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isHidden"));
  }
}

- (void)invalidate
{
  self->_invalid = 1;
}

- (void)reloadSpecifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[STGroupSpecifierProvider delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "specifierProvider:reloadSpecifier:animated:", self, v7, v4);

}

- (void)reloadSectionHeaderFootersWithAnimation:(int64_t)a3
{
  id v5;

  if (!-[STGroupSpecifierProvider isHidden](self, "isHidden"))
  {
    -[STGroupSpecifierProvider delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specifierProvider:reloadSectionHeaderFootersWithAnimation:", self, a3);

  }
}

- (void)showController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[STGroupSpecifierProvider delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "specifierProvider:showController:animated:", self, v7, v4);

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[STGroupSpecifierProvider delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "specifierProvider:presentViewController:animated:", self, v7, v4);

}

- (void)dismissViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[STGroupSpecifierProvider delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "specifierProvider:dismissViewControllerAnimated:", self, v3);

}

- (void)showConfirmationViewForSpecifier:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[STGroupSpecifierProvider delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "specifierProvider:showConfirmationViewForSpecifier:", self, v5);

}

- (void)popToViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[STGroupSpecifierProvider delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "specifierProvider:popToViewControllerAnimated:", self, v3);

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  v8 = a5;
  -[STGroupSpecifierProvider delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "specifierProvider:presentViewController:animated:completion:", self, v10, v6, v8);

}

- (void)beginUpdates
{
  id v3;

  -[STGroupSpecifierProvider delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "specifierProviderBeginUpdates:", self);

}

- (void)endUpdates
{
  id v3;

  -[STGroupSpecifierProvider delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "specifierProviderEndUpdates:", self);

}

- (void)lazyLoadBundle:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[STGroupSpecifierProvider delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "specifierProvider:lazyLoadBundle:", self, v5);

}

- (void)showPINSheet:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a4)
  {
    v6 = _Block_copy(a4);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, 0x24DB90C10);

  }
  -[STGroupSpecifierProvider delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "specifierProvider:showPINSheet:", self, v8);

}

- (void)showStoreDemoAlert
{
  id v3;

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerForFeatureNotAvailable");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[STGroupSpecifierProvider presentViewController:animated:](self, "presentViewController:animated:", v3, 1);

}

- (NSMutableArray)mutableSpecifiers
{
  return (NSMutableArray *)-[STGroupSpecifierProvider mutableArrayValueForKey:](self, "mutableArrayValueForKey:", CFSTR("specifiers"));
}

- (NSArray)specifiers
{
  void *v2;
  void *v3;

  -[STGroupSpecifierProvider privateSpecifiers](self, "privateSpecifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (id)specifiersAtIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[STGroupSpecifierProvider privateSpecifiers](self, "privateSpecifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)insertSpecifiers:(id)a3 atIndexes:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[STGroupSpecifierProvider privateSpecifiers](self, "privateSpecifiers");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertObjects:atIndexes:", v7, v6);

}

- (void)removeSpecifiersAtIndexes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[STGroupSpecifierProvider privateSpecifiers](self, "privateSpecifiers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectsAtIndexes:", v4);

}

- (void)replaceObjectInSpecifiersAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[STGroupSpecifierProvider privateSpecifiers](self, "privateSpecifiers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:atIndexedSubscript:", v6, a3);

}

- (void)replaceSpecifiersAtIndexes:(id)a3 withSpecifiers:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[STGroupSpecifierProvider privateSpecifiers](self, "privateSpecifiers");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replaceObjectsAtIndexes:withObjects:", v7, v6);

}

- (void)_tableCellHeightDidChange:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "specifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[STGroupSpecifierProvider specifiers](self, "specifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if (v6)
      -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v4, 0);
  }

}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (STGroupSpecifierProviderDelegate)delegate
{
  return (STGroupSpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupSpecifier, a3);
}

- (NSMutableArray)privateSpecifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPrivateSpecifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)invalid
{
  return self->_invalid;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateSpecifiers, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
