@implementation ACTAcceptCandidate

- (ACTAcceptCandidate)initWithCandidate:(id)a3 timestamp:(double)a4
{
  return -[ACTAcceptCandidate initWithCandidate:timestamp:intendedCandidate:](self, "initWithCandidate:timestamp:intendedCandidate:", a3, 0, a4);
}

- (ACTAcceptCandidate)initWithCandidate:(id)a3 timestamp:(double)a4 intendedCandidate:(id)a5
{
  id v9;
  id v10;
  ACTAcceptCandidate *v11;
  ACTAcceptCandidate *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ACTAcceptCandidate;
  v11 = -[ACTAcceptCandidate init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_candidate, a3);
    v12->_timestamp = a4;
    objc_storeStrong((id *)&v12->_intendedCandidate, a5);
  }

  return v12;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTAcceptCandidate candidate](self, "candidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTAcceptCandidate timestamp](self, "timestamp");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: candidate=%@, t=%.2f>"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  int v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[ACTAcceptCandidate candidate](self, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("Prediction Accepted");
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR(" ")) & 1) == 0)
  {
    -[ACTAcceptCandidate candidate](self, "candidate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "input");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", &stru_24FD49B78);
    v9 = CFSTR("Completion Accepted");
    if (v8)
      v9 = CFSTR("Prediction Accepted");
    v5 = v9;

  }
  v10 = (void *)MEMORY[0x24BDD17C8];
  -[ACTAcceptCandidate candidate](self, "candidate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "candidate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: %@ "), v5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACTAcceptCandidate candidate](self, "candidate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ACTAcceptCandidate timestamp](self, "timestamp");
  objc_msgSend(v7, "_performAcceptCandidate:timestamp:typingLog:predictiveCandidate:intendedTransliteration:", v8, v6, 1, self->_intendedCandidate);

}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (NSString)intendedCandidate
{
  return self->_intendedCandidate;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intendedCandidate, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
}

@end
