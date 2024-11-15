@implementation OISFUZipRecordInputStream

- (OISFUZipRecordInputStream)initWithDataRepresentation:(id)a3
{
  self->mInput = (OISFUBufferedInputStream *)(id)objc_msgSend(a3, "bufferedInputStream");
  return self;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OISFUZipRecordInputStream;
  -[OISFUZipRecordInputStream dealloc](&v3, sel_dealloc);
}

- (const)dataAtOffset:(int64_t)a3 size:(unint64_t)a4 end:(int64_t)a5
{
  int64_t v9;
  uint64_t v10;
  int64_t mBufferStart;
  unint64_t v12;

  if (a3 < 0 || (a4 ^ 0x7FFFFFFFFFFFFFFFLL) < a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("SFUZipArchiveError"), CFSTR("Size overflow."));
  v9 = a4 + a3;
  if (a5)
  {
    if (v9 > a5)
    {
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OISFUZipRecordInputStream dataAtOffset:size:end:]");
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchive.m"), 699, 0, "End offset is too small.");
      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
  }
  else
  {
    a5 = a4 + a3;
  }
  mBufferStart = self->mBufferStart;
  if (mBufferStart > a3 || v9 > self->mBufferEnd)
  {
    -[OISFUBufferedInputStream seekToOffset:](self->mInput, "seekToOffset:", a3);
    v12 = -[OISFUBufferedInputStream readToOwnBuffer:size:](self->mInput, "readToOwnBuffer:size:", &self->mBuffer, a5 - a3);
    if (v12 < a4)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("SFUZipArchiveError"), CFSTR("Could not read Zip record."));
    self->mBufferStart = a3;
    self->mBufferEnd = v12 + a3;
    mBufferStart = a3;
  }
  return &self->mBuffer[a3 - mBufferStart];
}

@end
