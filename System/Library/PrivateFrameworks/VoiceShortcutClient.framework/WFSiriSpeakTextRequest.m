@implementation WFSiriSpeakTextRequest

- (WFSiriSpeakTextRequest)initWithUtterance:(id)a3
{
  id v5;
  WFSiriSpeakTextRequest *v6;
  WFSiriSpeakTextRequest *v7;
  WFSiriSpeakTextRequest *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriSpeakTextRequest;
  v6 = -[WFSiriActionRequest init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_utterance, a3);
    v8 = v7;
  }

  return v7;
}

- (WFSiriSpeakTextRequest)initWithCoder:(id)a3
{
  id v4;
  WFSiriSpeakTextRequest *v5;
  uint64_t v6;
  NSString *utterance;
  WFSiriSpeakTextRequest *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriSpeakTextRequest;
  v5 = -[WFSiriActionRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("utterance"));
    v6 = objc_claimAutoreleasedReturnValue();
    utterance = v5->_utterance;
    v5->_utterance = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFSiriSpeakTextRequest;
  v4 = a3;
  -[WFSiriActionRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFSiriSpeakTextRequest utterance](self, "utterance", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("utterance"));

}

- (NSString)utterance
{
  return self->_utterance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
