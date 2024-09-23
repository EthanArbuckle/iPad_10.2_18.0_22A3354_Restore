@implementation UNCSummary

- (UNCSummary)initWithBundleIdentifier:(id)a3 notificationIdentifier:(id)a4 spotlightIdentifier:(id)a5 groupSummary:(BOOL)a6 content:(id)a7 threadIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  UNCSummary *v18;
  UNCSummary *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)UNCSummary;
  v18 = -[UNCSummary init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v19->_notificationIdentifier, a4);
    objc_storeStrong((id *)&v19->_spotlightIdentifier, a5);
    v19->_groupSummary = a6;
    objc_storeStrong((id *)&v19->_content, a7);
    objc_storeStrong((id *)&v19->_threadIdentifier, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[UNCSummary bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

  -[UNCSummary notificationIdentifier](self, "notificationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("notificationIdentifier"));

  -[UNCSummary spotlightIdentifier](self, "spotlightIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("spotlightIdentifier"));

  objc_msgSend(v4, "encodeBool:forKey:", -[UNCSummary isGroupSummary](self, "isGroupSummary"), CFSTR("isGroupSummary"));
  -[UNCSummary content](self, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("content"));

  -[UNCSummary threadIdentifier](self, "threadIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("threadIdentifier"));

}

- (UNCSummary)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  UNCSummary *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notificationIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("spotlightIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isGroupSummary"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("content"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("threadIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[UNCSummary initWithBundleIdentifier:notificationIdentifier:spotlightIdentifier:groupSummary:content:threadIdentifier:](self, "initWithBundleIdentifier:notificationIdentifier:spotlightIdentifier:groupSummary:content:threadIdentifier:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)notificationIdentifier
{
  return self->_notificationIdentifier;
}

- (NSString)spotlightIdentifier
{
  return self->_spotlightIdentifier;
}

- (BOOL)isGroupSummary
{
  return self->_groupSummary;
}

- (NSAttributedString)content
{
  return self->_content;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_spotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
