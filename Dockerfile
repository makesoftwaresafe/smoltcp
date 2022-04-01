FROM fuzzers/cargo-fuzz:0.10.0 as builder
COPY . .
RUN cargo fuzz build packet_parser

FROM debian:buster-slim
# Set to fuzz!
COPY --from=builder /fuzz/target/x86_64-unknown-linux-gnu/release/packet_parser /packet_parser
ENTRYPOINT []
CMD ['/packet_parser']
