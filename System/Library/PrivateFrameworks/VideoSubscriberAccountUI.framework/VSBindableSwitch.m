@implementation VSBindableSwitch

- (void)_updateBindingForValueChanged:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[VSBindableSwitch isOn](self, "isOn", a3));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VSBindableSwitch vs_setValue:forBinding:](self, "vs_setValue:forBinding:", v4, CFSTR("on"));

}

- (void)vs_bind:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6
{
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VSBindableSwitch;
  v10 = a3;
  -[VSBindableSwitch vs_bind:toObject:withKeyPath:options:](&v11, sel_vs_bind_toObject_withKeyPath_options_, v10, a4, a5, a6);
  LODWORD(a6) = objc_msgSend(v10, "isEqual:", CFSTR("on"), v11.receiver, v11.super_class);

  if ((_DWORD)a6)
    -[VSBindableSwitch addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, sel__updateBindingForValueChanged_, 4096);
}

- (void)vs_unbind:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", CFSTR("on")))
    -[VSBindableSwitch removeTarget:action:forControlEvents:](self, "removeTarget:action:forControlEvents:", self, sel__updateBindingForValueChanged_, 4096);
  v5.receiver = self;
  v5.super_class = (Class)VSBindableSwitch;
  -[VSBindableSwitch vs_unbind:](&v5, sel_vs_unbind_, v4);

}

@end
