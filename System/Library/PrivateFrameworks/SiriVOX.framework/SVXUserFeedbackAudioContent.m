@implementation SVXUserFeedbackAudioContent

- (SVXUserFeedbackAudioContent)initWithItemURL:(id)a3 numberOfLoops:(unint64_t)a4 fadeInDuration:(double)a5 fadeOutDuration:(double)a6
{
  id v10;
  SVXUserFeedbackAudioContent *v11;
  uint64_t v12;
  NSURL *itemURL;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SVXUserFeedbackAudioContent;
  v11 = -[SVXUserFeedbackAudioContent init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    itemURL = v11->_itemURL;
    v11->_itemURL = (NSURL *)v12;

    v11->_numberOfLoops = a4;
    v11->_fadeInDuration = a5;
    v11->_fadeOutDuration = a6;
  }

  return v11;
}

- (id)description
{
  return -[SVXUserFeedbackAudioContent _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)SVXUserFeedbackAudioContent;
  -[SVXUserFeedbackAudioContent description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {itemURL = %@, numberOfLoops = %llu, fadeInDuration = %f, fadeOutDuration = %f}"), v5, self->_itemURL, self->_numberOfLoops, *(_QWORD *)&self->_fadeInDuration, *(_QWORD *)&self->_fadeOutDuration);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = -[NSURL hash](self->_itemURL, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_numberOfLoops);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_fadeInDuration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_fadeOutDuration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  SVXUserFeedbackAudioContent *v4;
  SVXUserFeedbackAudioContent *v5;
  unint64_t numberOfLoops;
  double fadeInDuration;
  double v8;
  double fadeOutDuration;
  double v10;
  BOOL v11;
  NSURL *v13;
  NSURL *itemURL;

  v4 = (SVXUserFeedbackAudioContent *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      numberOfLoops = self->_numberOfLoops;
      if (numberOfLoops == -[SVXUserFeedbackAudioContent numberOfLoops](v5, "numberOfLoops")
        && (fadeInDuration = self->_fadeInDuration,
            -[SVXUserFeedbackAudioContent fadeInDuration](v5, "fadeInDuration"),
            fadeInDuration == v8)
        && (fadeOutDuration = self->_fadeOutDuration,
            -[SVXUserFeedbackAudioContent fadeOutDuration](v5, "fadeOutDuration"),
            fadeOutDuration == v10))
      {
        -[SVXUserFeedbackAudioContent itemURL](v5, "itemURL");
        v13 = (NSURL *)objc_claimAutoreleasedReturnValue();
        itemURL = self->_itemURL;
        v11 = itemURL == v13 || -[NSURL isEqual:](itemURL, "isEqual:", v13);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (SVXUserFeedbackAudioContent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  SVXUserFeedbackAudioContent *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXUserFeedbackAudioContent::itemURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXUserFeedbackAudioContent::numberOfLoops"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXUserFeedbackAudioContent::fadeInDuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXUserFeedbackAudioContent::fadeOutDuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  v14 = -[SVXUserFeedbackAudioContent initWithItemURL:numberOfLoops:fadeInDuration:fadeOutDuration:](self, "initWithItemURL:numberOfLoops:fadeInDuration:fadeOutDuration:", v5, v7, v10, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *itemURL;
  id v5;
  void *v6;
  void *v7;
  id v8;

  itemURL = self->_itemURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", itemURL, CFSTR("SVXUserFeedbackAudioContent::itemURL"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_numberOfLoops);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("SVXUserFeedbackAudioContent::numberOfLoops"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_fadeInDuration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("SVXUserFeedbackAudioContent::fadeInDuration"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_fadeOutDuration);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("SVXUserFeedbackAudioContent::fadeOutDuration"));

}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (unint64_t)numberOfLoops
{
  return self->_numberOfLoops;
}

- (double)fadeInDuration
{
  return self->_fadeInDuration;
}

- (double)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemURL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXUserFeedbackAudioContentMutation *);
  _SVXUserFeedbackAudioContentMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXUserFeedbackAudioContentMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXUserFeedbackAudioContentMutation initWithBaseModel:]([_SVXUserFeedbackAudioContentMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXUserFeedbackAudioContentMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXUserFeedbackAudioContent copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXUserFeedbackAudioContentMutation *);
  _SVXUserFeedbackAudioContentMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXUserFeedbackAudioContentMutation *))a3;
  v4 = objc_alloc_init(_SVXUserFeedbackAudioContentMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXUserFeedbackAudioContentMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
