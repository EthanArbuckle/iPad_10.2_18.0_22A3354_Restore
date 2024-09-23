@implementation _SVXDeviceProblemsStateMutation

- (_SVXDeviceProblemsStateMutation)init
{
  return -[_SVXDeviceProblemsStateMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXDeviceProblemsStateMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXDeviceProblemsStateMutation *v6;
  _SVXDeviceProblemsStateMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXDeviceProblemsStateMutation;
  v6 = -[_SVXDeviceProblemsStateMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setIsFixingProblems:(BOOL)a3
{
  self->_isFixingProblems = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setProblems:(unint64_t)a3
{
  self->_problems = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)generate
{
  SVXDeviceProblemsState *baseModel;
  SVXDeviceProblemsState *v4;
  SVXDeviceProblemsState *v5;
  _BOOL8 isFixingProblems;
  unint64_t problems;
  uint64_t v8;
  unint64_t v9;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v5 = [SVXDeviceProblemsState alloc];
    isFixingProblems = self->_isFixingProblems;
    problems = self->_problems;
LABEL_11:
    v4 = -[SVXDeviceProblemsState initWithIsFixingProblems:problems:](v5, "initWithIsFixingProblems:problems:", isFixingProblems, problems);
    return v4;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) != 0)
  {
    if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    {
      v8 = self->_isFixingProblems;
      if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
        goto LABEL_7;
    }
    else
    {
      v8 = -[SVXDeviceProblemsState isFixingProblems](baseModel, "isFixingProblems");
      if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
      {
LABEL_7:
        v9 = self->_problems;
LABEL_10:
        v5 = [SVXDeviceProblemsState alloc];
        isFixingProblems = v8;
        problems = v9;
        goto LABEL_11;
      }
    }
    v9 = -[SVXDeviceProblemsState problems](self->_baseModel, "problems");
    goto LABEL_10;
  }
  v4 = (SVXDeviceProblemsState *)-[SVXDeviceProblemsState copy](baseModel, "copy");
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
