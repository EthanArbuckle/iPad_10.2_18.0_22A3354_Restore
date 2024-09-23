@implementation VMVoicemailGreeting

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VMVoicemailGreeting)initWithCoder:(id)a3
{
  id v4;
  VMVoicemailGreeting *v5;
  void *v6;
  uint64_t v7;
  NSURL *url;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VMVoicemailGreeting;
  v5 = -[VMVoicemailGreeting init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("duration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_duration = (double)(unint64_t)objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v7 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v9, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double duration;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD16E0];
  duration = self->_duration;
  v6 = a3;
  objc_msgSend(v4, "numberWithDouble:", duration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("duration"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_url, CFSTR("url"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_type);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("type"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<VMVoicemailGreeting type=%lu, duration=%lu, url=%@>"), self->_type, (unint64_t)self->_duration, self->_url);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
