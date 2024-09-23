@implementation THWReviewInfo

- (THWReviewInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 stageGeometry:(id)a6
{
  THWReviewInfo *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THWReviewInfo;
  v8 = -[THWReviewInfo initWithContext:geometry:](&v10, "initWithContext:geometry:", a3, a4);
  if (v8)
  {
    v8->_style = (TSWWidgetStyle *)a5;
    v8->_stageGeometry = (THWStageGeometry *)a6;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewInfo;
  -[THWReviewInfo dealloc](&v3, "dealloc");
}

- (void)addQuestion:(id)a3
{
  NSMutableArray *questions;

  if (a3)
  {
    questions = self->_questions;
    if (!questions)
    {
      questions = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      self->_questions = questions;
    }
    -[NSMutableArray addObject:](questions, "addObject:", a3);
  }
}

- (id)questionAtIndex:(unint64_t)a3
{
  if ((unint64_t)-[NSMutableArray count](self->_questions, "count") <= a3)
    return 0;
  else
    return -[NSMutableArray objectAtIndex:](self->_questions, "objectAtIndex:", a3);
}

- (unint64_t)indexOfQuestion:(id)a3
{
  return (unint64_t)-[NSMutableArray indexOfObjectIdenticalTo:](self->_questions, "indexOfObjectIdenticalTo:", a3);
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(THWReviewLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(THWReviewRep, a2);
}

- (TSUColor)primaryColor
{
  return 0;
}

- (void)updateWithUniqueID:(id)a3 contentNodeGUID:(id)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  NSMutableArray *obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v7 = objc_alloc((Class)NSString);
  self->_reviewID = (NSString *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@%@:%@"), kTHWReviewWidgetInfoIDPrefix, a4, a3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = self->_questions;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "setQuestionID:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@:%@:%lu"), kTHWReviewWidgetInfoQuestionDescriptionIDPrefix, a4, a3, -[NSMutableArray indexOfObjectIdenticalTo:](self->_questions, "indexOfObjectIdenticalTo:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i))));
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }
}

- (id)childEnumerator
{
  id v3;
  void *v4;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v4 = v3;
  if (self->_adornmentInfo)
    objc_msgSend(v3, "addObject:");
  return objc_msgSend(v4, "objectEnumerator");
}

- (NSArray)questions
{
  return &self->_questions->super;
}

- (THWWidgetAdornmentInfo)adornmentInfo
{
  return self->_adornmentInfo;
}

- (void)setAdornmentInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)progressKitID
{
  return self->_progressKitID;
}

- (void)setProgressKitID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)progressKitSectionID
{
  return self->_progressKitSectionID;
}

- (void)setProgressKitSectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (TSWWidgetStyle)style
{
  return self->_style;
}

- (THWStageGeometry)stageGeometry
{
  return self->_stageGeometry;
}

- (double)contentPadding
{
  return self->_contentPadding;
}

- (void)setContentPadding:(double)a3
{
  self->_contentPadding = a3;
}

- (TSWPParagraphStyle)questionNumberStyle
{
  return self->_questionNumberStyle;
}

- (void)setQuestionNumberStyle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSString)reviewID
{
  return self->_reviewID;
}

@end
