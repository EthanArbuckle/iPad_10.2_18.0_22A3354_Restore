@implementation _ICQOpportunityBubbleImageDetails

- (_ICQOpportunityBubbleImageDetails)initWithServerDictionary:(id)a3
{
  id v4;
  _ICQOpportunityBubbleImageDetails *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_ICQOpportunityBubbleImageDetails;
  v5 = -[_ICQOpportunityBubbleImageDetails init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("3x"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQOpportunityBubbleImageDetails setUrlFor3x:](v5, "setUrlFor3x:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("2x"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQOpportunityBubbleImageDetails setUrlFor2x:](v5, "setUrlFor2x:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("1x"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQOpportunityBubbleImageDetails setUrlFor1x:](v5, "setUrlFor1x:", v8);

  }
  return v5;
}

- (id)getURLForScale:(int64_t)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 3:
      -[_ICQOpportunityBubbleImageDetails urlFor3x](self, "urlFor3x");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      -[_ICQOpportunityBubbleImageDetails urlFor2x](self, "urlFor2x");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      -[_ICQOpportunityBubbleImageDetails urlFor1x](self, "urlFor1x");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v5 = v4;
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
  }
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = a3;
    _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "Invalid scale %ld", (uint8_t *)&v8, 0xCu);
  }
  v6 = 0;
LABEL_11:

  return v6;
}

- (NSString)urlFor3x
{
  return self->_urlFor3x;
}

- (void)setUrlFor3x:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)urlFor2x
{
  return self->_urlFor2x;
}

- (void)setUrlFor2x:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)urlFor1x
{
  return self->_urlFor1x;
}

- (void)setUrlFor1x:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlFor1x, 0);
  objc_storeStrong((id *)&self->_urlFor2x, 0);
  objc_storeStrong((id *)&self->_urlFor3x, 0);
}

@end
