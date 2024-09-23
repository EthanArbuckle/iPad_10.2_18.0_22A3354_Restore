@implementation WFBlockKeyCommand

+ (id)commandWithTitle:(id)a3 input:(id)a4 modifierFlags:(int64_t)a5 block:(id)a6
{
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  void *v19;
  void *v20;
  void *v21;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFBlockKeyCommand.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("input"));

    if (v13)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFBlockKeyCommand.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

  if (!v12)
    goto LABEL_8;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFBlockKeyCommand.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

LABEL_4:
  objc_msgSend(a1, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v11, 0, sel_wf_handleBlockKeyCommand_, v12, a5, 0);
  v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = objc_msgSend(v13, "copy");
    v16 = (void *)v14[34];
    v14[34] = v15;

    v17 = v14;
  }

  return v14;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
