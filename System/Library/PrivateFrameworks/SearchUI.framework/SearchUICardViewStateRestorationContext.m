@implementation SearchUICardViewStateRestorationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SearchUICardViewStateRestorationContext)initWithCoder:(id)a3
{
  id v4;
  SearchUICardViewStateRestorationContext *v5;
  uint64_t v6;
  SFCard *card;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUICardViewStateRestorationContext;
  v5 = -[SearchUICollectionViewRestorationContext initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("card"));
    v6 = objc_claimAutoreleasedReturnValue();
    card = v5->_card;
    v5->_card = (SFCard *)v6;

    v5->_level = (int)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("level"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUICardViewStateRestorationContext;
  v4 = a3;
  -[SearchUICollectionViewRestorationContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_card, CFSTR("card"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_level, CFSTR("level"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUICardViewStateRestorationContext;
  v4 = -[SearchUICollectionViewRestorationContext copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[SearchUICardViewStateRestorationContext card](self, "card");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCard:", v5);

  objc_msgSend(v4, "setLevel:", -[SearchUICardViewStateRestorationContext level](self, "level"));
  return v4;
}

- (unint64_t)level
{
  return self->_level;
}

- (void)setLevel:(unint64_t)a3
{
  self->_level = a3;
}

- (SFCard)card
{
  return (SFCard *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCard:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_card, 0);
}

@end
