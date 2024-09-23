@implementation TUIVideoEventMetadata

- (TUIVideoEventMetadata)initWithEventCase:(unint64_t)a3 mode:(unint64_t)a4 isMuted:(BOOL)a5 isPlaying:(BOOL)a6 mediaTimePlayed:(double)a7 mediaDuration:(double)a8 mediaId:(id)a9
{
  TUIVideoEventMetadata *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TUIVideoEventMetadata;
  result = -[TUIVideoMetadataBase initWithMode:isMuted:isPlaying:mediaTimePlayed:mediaDuration:mediaId:](&v11, "initWithMode:isMuted:isPlaying:mediaTimePlayed:mediaDuration:mediaId:", a4, a5, a6, a9, a7, a8);
  if (result)
    result->_eventCase = a3;
  return result;
}

- (id)serialize
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;
  const __CFString *v11;
  void *v12;

  v3 = objc_alloc((Class)NSMutableDictionary);
  v10.receiver = self;
  v10.super_class = (Class)TUIVideoEventMetadata;
  v4 = -[TUIVideoMetadataBase serialize](&v10, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithDictionary:", v5);

  v11 = CFSTR("eventCase");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoEventMetadata eventCaseAsString](self, "eventCaseAsString"));
  v12 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  objc_msgSend(v6, "addEntriesFromDictionary:", v8);

  return v6;
}

- (id)eventCaseAsString
{
  if (qword_2CB688 != -1)
    dispatch_once(&qword_2CB688, &stru_241270);
  return objc_msgSend((id)qword_2CB680, "objectAtIndexedSubscript:", self->_eventCase);
}

- (id)triggerForEvent:(unint64_t)a3
{
  if (qword_2CB698 != -1)
    dispatch_once(&qword_2CB698, &stru_241290);
  return objc_msgSend((id)qword_2CB690, "objectAtIndexedSubscript:", a3);
}

- (unint64_t)eventCase
{
  return self->_eventCase;
}

@end
