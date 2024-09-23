@implementation FeedbackSubmissionPostAction

- (FeedbackSubmissionPostAction)initWithCoder:(id)a3
{
  id v4;
  FeedbackSubmissionPostAction *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FeedbackSubmissionPostAction;
  v5 = -[FeedbackSubmissionPostAction init](&v12, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("data"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[FeedbackSubmissionPostAction setData:](v5, "setData:", v7);

    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("communityIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_msgSend(v9, "copy");
    -[FeedbackSubmissionPostAction setCommunityIdentifier:](v5, "setCommunityIdentifier:", v10);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FeedbackSubmissionPostAction data](self, "data"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[FeedbackSubmissionPostAction communityIdentifier](self, "communityIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("communityIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSString)communityIdentifier
{
  return self->_communityIdentifier;
}

- (void)setCommunityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_communityIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
