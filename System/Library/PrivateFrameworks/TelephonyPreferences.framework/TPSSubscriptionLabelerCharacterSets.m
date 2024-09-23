@implementation TPSSubscriptionLabelerCharacterSets

+ (USet)_characterSetFromPattern:(id)a3
{
  void *v3;
  USet *v4;

  if (!a3)
    return 0;
  +[TPSSubscriptionLabeler _resultWithAllCharacters:string:](TPSSubscriptionLabeler, "_resultWithAllCharacters:string:", &__block_literal_global_4, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (USet *)objc_msgSend(v3, "pointerValue");

  return v4;
}

id __64__TPSSubscriptionLabelerCharacterSets__characterSetFromPattern___block_invoke()
{
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", uset_openPattern());
  return (id)objc_claimAutoreleasedReturnValue();
}

- (TPSSubscriptionLabelerCharacterSets)init
{
  TPSSubscriptionLabelerCharacterSets *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TPSSubscriptionLabelerCharacterSets;
  v2 = -[TPSSubscriptionLabelerCharacterSets init](&v4, sel_init);
  if (v2)
    v2->_CJK = (USet *)objc_msgSend((id)objc_opt_class(), "_characterSetFromPattern:", CFSTR("[[:Hani:][:Hiragana:][[:scx=Kana:]][:Bopomofo:][ˉˊˇˋ˙][:Hangul:][()（）]]"));
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  uset_close();
  v3.receiver = self;
  v3.super_class = (Class)TPSSubscriptionLabelerCharacterSets;
  -[TPSSubscriptionLabelerCharacterSets dealloc](&v3, sel_dealloc);
}

- (USet)CJK
{
  return self->_CJK;
}

@end
