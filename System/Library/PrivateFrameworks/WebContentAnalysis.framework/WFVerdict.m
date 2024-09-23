@implementation WFVerdict

+ (id)verdictWithRestriction:(BOOL)a3 URL:(id)a4 evidence:(int)a5 LSMEvaluationResult:(id)a6 message:(id)a7
{
  uint64_t v9;
  _BOOL8 v11;
  void *v12;

  v9 = *(_QWORD *)&a5;
  v11 = a3;
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setRestricted:", v11);
  objc_msgSend(v12, "setURL:", a4);
  objc_msgSend(v12, "setEvidence:", v9);
  objc_msgSend(v12, "setLSMEvaluationResult:", a6);
  objc_msgSend(v12, "setMessage:", a7);
  return v12;
}

- (BOOL)restricted
{
  return self->restricted;
}

- (void)setRestricted:(BOOL)a3
{
  self->restricted = a3;
}

- (id)LSMEvaluationResult
{
  return self->LSMEvaluationResult;
}

- (void)setLSMEvaluationResult:(id)a3
{
  id v5;

  v5 = a3;

  self->LSMEvaluationResult = (WFLSMResult *)a3;
}

- (id)message
{
  return self->message;
}

- (void)setMessage:(id)a3
{
  id v5;

  v5 = a3;

  self->message = (NSString *)a3;
}

- (id)URL
{
  return self->URL;
}

- (void)setURL:(id)a3
{
  id v5;

  v5 = a3;

  self->URL = (NSString *)a3;
}

- (int)evidence
{
  return self->evidence;
}

- (void)setEvidence:(int)a3
{
  self->evidence = a3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@ | %@ | %@"), objc_msgSend(-[WFVerdict LSMEvaluationResult](self, "LSMEvaluationResult"), "debugDescription"), -[WFVerdict message](self, "message"), -[WFVerdict URL](self, "URL"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFVerdict;
  -[WFVerdict dealloc](&v3, sel_dealloc);
}

@end
