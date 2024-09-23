@implementation ConversationSearchTextRange

- (id)description
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class(self);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%s: %p, id: %@, webkitRange: %@"), class_getName(v3), self, self->_documentID, self->_webkitRange);
}

- (ConversationSearchTextRange)initWithWebkitRange:(id)a3 documentID:(id)a4
{
  id v7;
  id v8;
  ConversationSearchTextRange *v9;
  ConversationSearchTextRange *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ConversationSearchTextRange;
  v9 = -[ConversationSearchTextRange init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webkitRange, a3);
    objc_storeStrong((id *)&v10->_documentID, a4);
  }

  return v10;
}

- (BOOL)isEmpty
{
  if (self)
    self = (ConversationSearchTextRange *)self->_webkitRange;
  return -[ConversationSearchTextRange isEmpty](self, "isEmpty");
}

- (id)start
{
  if (self)
    self = (ConversationSearchTextRange *)self->_webkitRange;
  return (id)objc_claimAutoreleasedReturnValue(-[ConversationSearchTextRange start](self, "start"));
}

- (id)end
{
  if (self)
    self = (ConversationSearchTextRange *)self->_webkitRange;
  return (id)objc_claimAutoreleasedReturnValue(-[ConversationSearchTextRange end](self, "end"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentID, 0);
  objc_storeStrong((id *)&self->_webkitRange, 0);
}

@end
