@implementation SVXDeviceSetupFlowDisplayKeyFrame

- (SVXDeviceSetupFlowDisplayKeyFrame)initWithKeyFrameID:(int64_t)a3 text:(id)a4 offset:(double)a5 duration:(double)a6
{
  id v10;
  SVXDeviceSetupFlowDisplayKeyFrame *v11;
  SVXDeviceSetupFlowDisplayKeyFrame *v12;
  uint64_t v13;
  NSString *text;
  objc_super v16;

  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SVXDeviceSetupFlowDisplayKeyFrame;
  v11 = -[SVXDeviceSetupFlowDisplayKeyFrame init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_keyFrameID = a3;
    v13 = objc_msgSend(v10, "copy");
    text = v12->_text;
    v12->_text = (NSString *)v13;

    v12->_offset = a5;
    v12->_duration = a6;
  }

  return v12;
}

- (id)description
{
  return -[SVXDeviceSetupFlowDisplayKeyFrame _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t keyFrameID;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  objc_super v11;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v11.receiver = self;
  v11.super_class = (Class)SVXDeviceSetupFlowDisplayKeyFrame;
  -[SVXDeviceSetupFlowDisplayKeyFrame description](&v11, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  keyFrameID = self->_keyFrameID;
  if (keyFrameID > 0xB)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_24D24C790[keyFrameID];
  v8 = v7;
  v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {keyFrameID = %@, text = %@, offset = %f, duration = %f}"), v5, v8, self->_text, *(_QWORD *)&self->_offset, *(_QWORD *)&self->_duration);

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_keyFrameID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_text, "hash") ^ v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_offset);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_duration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  SVXDeviceSetupFlowDisplayKeyFrame *v4;
  SVXDeviceSetupFlowDisplayKeyFrame *v5;
  int64_t keyFrameID;
  double offset;
  double v8;
  double duration;
  double v10;
  BOOL v11;
  NSString *v13;
  NSString *text;

  v4 = (SVXDeviceSetupFlowDisplayKeyFrame *)a3;
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
      keyFrameID = self->_keyFrameID;
      if (keyFrameID == -[SVXDeviceSetupFlowDisplayKeyFrame keyFrameID](v5, "keyFrameID")
        && (offset = self->_offset, -[SVXDeviceSetupFlowDisplayKeyFrame offset](v5, "offset"), offset == v8)
        && (duration = self->_duration, -[SVXDeviceSetupFlowDisplayKeyFrame duration](v5, "duration"), duration == v10))
      {
        -[SVXDeviceSetupFlowDisplayKeyFrame text](v5, "text");
        v13 = (NSString *)objc_claimAutoreleasedReturnValue();
        text = self->_text;
        v11 = text == v13 || -[NSString isEqual:](text, "isEqual:", v13);

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

- (SVXDeviceSetupFlowDisplayKeyFrame)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  SVXDeviceSetupFlowDisplayKeyFrame *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeviceSetupFlowDisplayKeyFrame::keyFrameID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeviceSetupFlowDisplayKeyFrame::text"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeviceSetupFlowDisplayKeyFrame::offset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeviceSetupFlowDisplayKeyFrame::duration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  v14 = -[SVXDeviceSetupFlowDisplayKeyFrame initWithKeyFrameID:text:offset:duration:](self, "initWithKeyFrameID:text:offset:duration:", v6, v7, v10, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t keyFrameID;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDD16E0];
  keyFrameID = self->_keyFrameID;
  v6 = a3;
  objc_msgSend(v4, "numberWithInteger:", keyFrameID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("SVXDeviceSetupFlowDisplayKeyFrame::keyFrameID"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_text, CFSTR("SVXDeviceSetupFlowDisplayKeyFrame::text"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_offset);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("SVXDeviceSetupFlowDisplayKeyFrame::offset"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_duration);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("SVXDeviceSetupFlowDisplayKeyFrame::duration"));

}

- (int64_t)keyFrameID
{
  return self->_keyFrameID;
}

- (NSString)text
{
  return self->_text;
}

- (double)offset
{
  return self->_offset;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXDeviceSetupFlowDisplayKeyFrameMutation *);
  _SVXDeviceSetupFlowDisplayKeyFrameMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXDeviceSetupFlowDisplayKeyFrameMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXDeviceSetupFlowDisplayKeyFrameMutation initWithBaseModel:]([_SVXDeviceSetupFlowDisplayKeyFrameMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXDeviceSetupFlowDisplayKeyFrameMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXDeviceSetupFlowDisplayKeyFrame copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXDeviceSetupFlowDisplayKeyFrameMutation *);
  _SVXDeviceSetupFlowDisplayKeyFrameMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXDeviceSetupFlowDisplayKeyFrameMutation *))a3;
  v4 = objc_alloc_init(_SVXDeviceSetupFlowDisplayKeyFrameMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXDeviceSetupFlowDisplayKeyFrameMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
