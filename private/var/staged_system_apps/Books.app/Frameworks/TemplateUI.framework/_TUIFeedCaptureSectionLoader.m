@implementation _TUIFeedCaptureSectionLoader

- (_TUIFeedCaptureSectionLoader)initWithTemplateURL:(id)a3 uuid:(id)a4 bindings:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TUIFeedCaptureSectionLoader *v11;
  _TUIFeedCaptureSectionLoader *v12;
  NSURL *v13;
  NSURL *templateURL;
  NSUUID *v15;
  NSUUID *uuid;
  NSDictionary *v17;
  NSDictionary *bindings;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_TUIFeedCaptureSectionLoader;
  v11 = -[_TUIFeedCaptureSectionLoader init](&v20, "init");
  v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    v13 = (NSURL *)objc_msgSend(v8, "copy");
    templateURL = v12->_templateURL;
    v12->_templateURL = v13;

    v15 = (NSUUID *)objc_msgSend(v9, "copy");
    uuid = v12->_uuid;
    v12->_uuid = v15;

    v17 = (NSDictionary *)objc_msgSend(v10, "copy");
    bindings = v12->_bindings;
    v12->_bindings = v17;

  }
  return v12;
}

- (id)feedEntry:(id)a3 requestDataWithPriority:(float)a4 block:(id)a5
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  id replyBlock;

  p_lock = &self->_lock;
  v7 = a5;
  os_unfair_lock_lock(p_lock);
  v8 = objc_msgSend(v7, "copy");

  replyBlock = self->_replyBlock;
  self->_replyBlock = v8;

  os_unfair_lock_unlock(p_lock);
  -[_TUIFeedCaptureSectionLoader _update](self, "_update");
  return 0;
}

- (void)updateTemplateURL:(id)a3 bindings:(id)a4
{
  NSURL *v6;
  NSDictionary *v7;
  NSURL *templateURL;
  NSURL *v9;
  NSDictionary *bindings;

  v6 = (NSURL *)a3;
  v7 = (NSDictionary *)a4;
  templateURL = self->_templateURL;
  self->_templateURL = v6;
  v9 = v6;

  bindings = self->_bindings;
  self->_bindings = v7;

  -[_TUIFeedCaptureSectionLoader _update](self, "_update");
}

- (void)_update
{
  NSDictionary *bindings;
  NSURL *templateURL;
  NSDictionary *v5;
  NSDictionary *v6;
  void *v7;
  os_unfair_lock_s *p_lock;
  void (**v9)(id, uint64_t, void *);
  _QWORD v10[2];
  _QWORD v11[2];

  bindings = self->_bindings;
  templateURL = self->_templateURL;
  v10[0] = CFSTR("template");
  v10[1] = CFSTR("data");
  v5 = (NSDictionary *)&__NSDictionary0__struct;
  if (bindings)
    v5 = bindings;
  v11[0] = templateURL;
  v11[1] = v5;
  v6 = bindings;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = (void (**)(id, uint64_t, void *))objc_retainBlock(self->_replyBlock);
  os_unfair_lock_unlock(p_lock);

  v9[2](v9, 1, v7);
}

- (NSURL)templateURL
{
  return self->_templateURL;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSDictionary)bindings
{
  return self->_bindings;
}

- (id)replyBlock
{
  return self->_replyBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_replyBlock, 0);
  objc_storeStrong((id *)&self->_bindings, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_templateURL, 0);
}

@end
