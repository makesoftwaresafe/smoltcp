FROM fuzzers/cargo-fuzz:0.10.0

COPY . .
RUN cargo fuzz build packet_parser

# Set to fuzz!
ENTRYPOINT []
CMD /fuzz/target/x86_64-unknown-linux-gnu/release/packet_parser