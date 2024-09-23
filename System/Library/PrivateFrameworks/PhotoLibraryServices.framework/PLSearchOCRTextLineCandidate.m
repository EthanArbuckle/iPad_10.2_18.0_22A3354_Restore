@implementation PLSearchOCRTextLineCandidate

- (PLSearchOCRTextLineCandidate)initWithLine:(id)a3 words:(id)a4 confidence:(double)a5
{
  id v8;
  id v9;
  PLSearchOCRTextLineCandidate *v10;
  uint64_t v11;
  NSString *line;
  uint64_t v13;
  NSArray *words;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PLSearchOCRTextLineCandidate;
  v10 = -[PLSearchOCRTextLineCandidate init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    line = v10->_line;
    v10->_line = (NSString *)v11;

    v10->_confidence = a5;
    v13 = objc_msgSend(v9, "copy");
    words = v10->_words;
    v10->_words = (NSArray *)v13;

  }
  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@:%p> "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("confidence: %f, "), *(_QWORD *)&self->_confidence);
  objc_msgSend(v3, "appendFormat:", CFSTR("line: '%@', "), self->_line);
  objc_msgSend(v3, "appendFormat:", CFSTR("words: %@, "), self->_words);
  return v3;
}

- (NSString)line
{
  return self->_line;
}

- (NSArray)words
{
  return self->_words;
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_words, 0);
  objc_storeStrong((id *)&self->_line, 0);
}

@end
