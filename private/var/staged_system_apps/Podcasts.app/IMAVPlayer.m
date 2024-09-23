@implementation IMAVPlayer

- (unint64_t)currentChapterIndexSwift
{
  return (unint64_t)-[IMAVPlayer currentChapterIndex](self, "currentChapterIndex");
}

- (void)setCurrentChapterIndexSwift:(unint64_t)a3
{
  -[IMAVPlayer setCurrentChapterIndex:](self, "setCurrentChapterIndex:", a3);
}

@end
