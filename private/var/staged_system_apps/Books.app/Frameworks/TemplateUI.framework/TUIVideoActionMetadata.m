@implementation TUIVideoActionMetadata

- (TUIVideoActionMetadata)initWithActionCase:(unint64_t)a3 origin:(unint64_t)a4 mode:(unint64_t)a5 isMuted:(BOOL)a6 isPlaying:(BOOL)a7 mediaTimePlayed:(double)a8 mediaDuration:(double)a9 mediaId:(id)a10
{
  TUIVideoActionMetadata *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TUIVideoActionMetadata;
  result = -[TUIVideoMetadataBase initWithMode:isMuted:isPlaying:mediaTimePlayed:mediaDuration:mediaId:](&v13, "initWithMode:isMuted:isPlaying:mediaTimePlayed:mediaDuration:mediaId:", a5, a6, a7, a10, a8, a9);
  if (result)
  {
    result->_actionCase = a3;
    result->_origin = a4;
  }
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
  void *v9;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[2];

  v3 = objc_alloc((Class)NSMutableDictionary);
  v11.receiver = self;
  v11.super_class = (Class)TUIVideoActionMetadata;
  v4 = -[TUIVideoMetadataBase serialize](&v11, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithDictionary:", v5);

  v12[0] = CFSTR("actionCase");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoActionMetadata actionCaseAsString](self, "actionCaseAsString"));
  v12[1] = CFSTR("origin");
  v13[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoActionMetadata originAsString](self, "originAsString"));
  v13[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
  objc_msgSend(v6, "addEntriesFromDictionary:", v9);

  return v6;
}

- (id)actionCaseAsString
{
  if (qword_2CB6A8 != -1)
    dispatch_once(&qword_2CB6A8, &stru_2412B0);
  return objc_msgSend((id)qword_2CB6A0, "objectAtIndexedSubscript:", self->_actionCase);
}

- (id)originAsString
{
  if (qword_2CB6B8 != -1)
    dispatch_once(&qword_2CB6B8, &stru_2412D0);
  return objc_msgSend((id)qword_2CB6B0, "objectAtIndexedSubscript:", self->_origin);
}

- (id)triggerForAction:(unint64_t)a3
{
  if (qword_2CB6C8 != -1)
    dispatch_once(&qword_2CB6C8, &stru_2412F0);
  return objc_msgSend((id)qword_2CB6C0, "objectAtIndexedSubscript:", a3);
}

- (unint64_t)actionCase
{
  return self->_actionCase;
}

- (unint64_t)origin
{
  return self->_origin;
}

@end
