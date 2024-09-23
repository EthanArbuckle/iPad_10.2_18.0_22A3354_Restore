@implementation THVisibleColumnProxy

- (THVisibleColumnProxy)initWithPageIndex:(unint64_t)a3 pageController:(id)a4
{
  THVisibleColumnProxy *v6;
  THVisibleColumnProxy *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THVisibleColumnProxy;
  v6 = -[THVisibleColumnProxy init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->mPageIndex = a3;
    v6->mPageController = (THPageController *)a4;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THVisibleColumnProxy;
  -[THVisibleColumnProxy dealloc](&v3, "dealloc");
}

- (unint64_t)startCharIndex
{
  return *((_QWORD *)-[THVisibleColumnProxy p_targetFirstHint](self, "p_targetFirstHint") + 4);
}

- (_NSRange)range
{
  const $76C9DF09DF30CB4FBD89D11B5573AD82 *v3;
  NSUInteger location;
  NSUInteger length;
  NSUInteger v6;
  NSUInteger v7;
  NSRange v8;
  NSRange v9;
  _NSRange result;
  NSRange v11;

  v3 = -[THVisibleColumnProxy p_targetFirstHint](self, "p_targetFirstHint");
  location = v3->var1.location;
  length = v3->var1.length;
  v11 = (NSRange)*((_OWORD *)-[THVisibleColumnProxy p_targetLastHint](self, "p_targetLastHint") + 2);
  v9.location = location;
  v9.length = length;
  v8 = NSUnionRange(v9, v11);
  v7 = v8.length;
  v6 = v8.location;
  result.length = v7;
  result.location = v6;
  return result;
}

- (unint64_t)startAnchoredCharIndex
{
  return *((_QWORD *)-[THVisibleColumnProxy p_targetFirstHint](self, "p_targetFirstHint") + 7);
}

- (_NSRange)anchoredRange
{
  const $76C9DF09DF30CB4FBD89D11B5573AD82 *v3;
  NSUInteger location;
  NSUInteger length;
  NSUInteger v6;
  NSUInteger v7;
  NSRange v8;
  NSRange v9;
  _NSRange result;
  NSRange v11;

  if (!-[THVisibleColumnProxy p_targetFirstHint](self, "p_targetFirstHint"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THVisibleColumnProxy anchoredRange]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THVisibleColumnProxy.mm"), 71, CFSTR("invalid nil value for '%s'"), "self.p_targetFirstHint");
  if (!-[THVisibleColumnProxy p_targetLastHint](self, "p_targetLastHint"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THVisibleColumnProxy anchoredRange]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THVisibleColumnProxy.mm"), 72, CFSTR("invalid nil value for '%s'"), "self.p_targetLastHint");
  v3 = -[THVisibleColumnProxy p_targetFirstHint](self, "p_targetFirstHint");
  location = v3->var3.location;
  length = v3->var3.length;
  v11 = *(NSRange *)((char *)-[THVisibleColumnProxy p_targetLastHint](self, "p_targetLastHint") + 56);
  v9.location = location;
  v9.length = length;
  v8 = NSUnionRange(v9, v11);
  v7 = v8.length;
  v6 = v8.location;
  result.length = v7;
  result.location = v6;
  return result;
}

- (unint64_t)nextWidowPullsDownFromCharIndex
{
  return *((_QWORD *)-[THVisibleColumnProxy p_targetLastHint](self, "p_targetLastHint") + 6);
}

- (void)trimToCharIndex:(unint64_t)a3 inTarget:(id)a4 removeAutoNumberFootnoteCount:(unint64_t)a5
{
  -[THPageController i_trimPageAtIndex:toCharIndex:inTarget:removeAutoNumberFootnoteCount:](self->mPageController, "i_trimPageAtIndex:toCharIndex:inTarget:removeAutoNumberFootnoteCount:", self->mPageIndex, a3, a4, a5);
}

- (const)p_targetFirstHint
{
  return (const $76C9DF09DF30CB4FBD89D11B5573AD82 *)objc_msgSend(-[THPageController i_pageHintForPageIndex:](self->mPageController, "i_pageHintForPageIndex:", self->mPageIndex), "firstHint");
}

- (const)p_targetLastHint
{
  return (const $76C9DF09DF30CB4FBD89D11B5573AD82 *)objc_msgSend(-[THPageController i_pageHintForPageIndex:](self->mPageController, "i_pageHintForPageIndex:", self->mPageIndex), "lastHint");
}

@end
