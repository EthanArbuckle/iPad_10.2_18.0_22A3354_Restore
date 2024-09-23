@implementation _VOSProfileKeyChord

+ (id)profileKeyChordWithKeyChord:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[_VOSProfileKeyChord _initWithKeyChord:]([_VOSProfileKeyChord alloc], "_initWithKeyChord:", v3);

  return v4;
}

+ (id)profileKeyChordWithStringValue:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDFF758], "keyChordWithString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "profileKeyChordWithKeyChord:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_initWithKeyChord:(id)a3
{
  id v5;
  _VOSProfileKeyChord *v6;
  _VOSProfileKeyChord *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_VOSProfileKeyChord;
  v6 = -[_VOSProfileKeyChord init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_keyChord, a3);

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VOSProfileKeyChord keyChord](self, "keyChord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p>: keys '%@'"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_VOSProfileKeyChord)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _VOSProfileKeyChord *v10;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("keyChord"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDFF758], "keyChordWithKeys:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_VOSProfileKeyChord _initWithKeyChord:](self, "_initWithKeyChord:", v9);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  AXSSKeyChord *keyChord;
  id v4;
  id v5;

  keyChord = self->_keyChord;
  v4 = a3;
  -[AXSSKeyChord keys](keyChord, "keys");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("keyChord"));

}

- (AXSSKeyChord)keyChord
{
  return self->_keyChord;
}

- (void)setKeyChord:(id)a3
{
  objc_storeStrong((id *)&self->_keyChord, a3);
}

- (_VOSProfileCommand)command
{
  return (_VOSProfileCommand *)objc_loadWeakRetained((id *)&self->_command);
}

- (void)setCommand:(id)a3
{
  objc_storeWeak((id *)&self->_command, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_command);
  objc_storeStrong((id *)&self->_keyChord, 0);
}

@end
