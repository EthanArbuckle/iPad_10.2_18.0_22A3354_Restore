@implementation H1JPEGVideoDecoder

void __H1JPEGVideoDecoder_Invalidate_block_invoke(uint64_t a1)
{
  IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(*(_QWORD *)(a1 + 32) + 168), 0);
}

@end
