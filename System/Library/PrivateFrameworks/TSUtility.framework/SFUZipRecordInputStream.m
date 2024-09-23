@implementation SFUZipRecordInputStream

- (SFUZipRecordInputStream)initWithDataRepresentation:(id)a3
{
  self->mInput = (SFUBufferedInputStream *)(id)objc_msgSend(a3, "bufferedInputStream");
  return self;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFUZipRecordInputStream;
  -[SFUZipRecordInputStream dealloc](&v3, sel_dealloc);
}

- (const)dataAtOffset:(int64_t)a3 size:(unint64_t)a4 end:(int64_t)a5
{
  int64_t v9;
  id v10;
  uint64_t v11;
  int64_t mBufferStart;
  unint64_t v13;

  if (a3 < 0 || (a4 ^ 0x7FFFFFFFFFFFFFFFLL) < a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("SFUZipArchiveError"), CFSTR("Size overflow."));
  v9 = a4 + a3;
  if (a5)
  {
    if (v9 > a5)
    {
      v10 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUZipRecordInputStream dataAtOffset:size:end:]");
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchive.m"), 770, CFSTR("End offset is too small."));
    }
  }
  else
  {
    a5 = a4 + a3;
  }
  mBufferStart = self->mBufferStart;
  if (mBufferStart > a3 || v9 > self->mBufferEnd)
  {
    -[SFUBufferedInputStream seekToOffset:](self->mInput, "seekToOffset:", a3);
    v13 = -[SFUBufferedInputStream readToOwnBuffer:size:](self->mInput, "readToOwnBuffer:size:", &self->mBuffer, a5 - a3);
    if (v13 < a4)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("SFUZipArchiveError"), CFSTR("Could not read Zip record."));
    self->mBufferStart = a3;
    self->mBufferEnd = v13 + a3;
    mBufferStart = a3;
  }
  return &self->mBuffer[a3 - mBufferStart];
}

@end
