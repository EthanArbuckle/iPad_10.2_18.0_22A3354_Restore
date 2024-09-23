@implementation boringssl_concrete_nw_protocol_boringssl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->current_input_frame, 0);
  objc_storeStrong((id *)&self->client_queue, 0);
  objc_storeStrong((id *)&self->association, 0);
  objc_storeStrong((id *)&self->parameters, 0);
  objc_storeStrong(&self->message_writer, 0);
  objc_storeStrong((id *)&self->pending_output_data, 0);
}

- (void)dealloc
{
  objc_super v3;

  nw_protocol_boringssl_cleanup(self);
  v3.receiver = self;
  v3.super_class = (Class)boringssl_concrete_nw_protocol_boringssl;
  -[boringssl_concrete_nw_protocol_boringssl dealloc](&v3, sel_dealloc);
}

@end
