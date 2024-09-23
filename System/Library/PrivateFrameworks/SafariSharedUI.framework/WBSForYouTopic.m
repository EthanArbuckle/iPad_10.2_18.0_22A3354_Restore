@implementation WBSForYouTopic

- (WBSForYouTopic)initWithTitle:(id)a3 identifier:(id)a4 relevancyDate:(id)a5 source:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  WBSForYouTopic *v13;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  NSString *identifier;
  WBSForYouTopic *v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WBSForYouTopic;
  v13 = -[WBSForYouTopic init](&v20, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    title = v13->_title;
    v13->_title = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v16;

    objc_storeStrong((id *)&v13->_relevancyDate, a5);
    v13->_source = a6;
    v18 = v13;
  }

  return v13;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)associatedTopics
{
  return self->_associatedTopics;
}

- (void)setAssociatedTopics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)relevancyDate
{
  return self->_relevancyDate;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevancyDate, 0);
  objc_storeStrong((id *)&self->_associatedTopics, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
