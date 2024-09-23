@implementation TUITriggerBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUITriggerLayout, a2);
}

+ (unint64_t)observationModeFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CB570 != -1)
  {
    dispatch_once(&qword_2CB570, &stru_240788);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CB568, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

- (double)anchorOffset
{
  return self->_anchorOffset;
}

- (void)setAnchorOffset:(double)a3
{
  self->_anchorOffset = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)observationMode
{
  return self->_observationMode;
}

- (void)setObservationMode:(unint64_t)a3
{
  self->_observationMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
