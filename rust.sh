#!/usr/bin/sh
#Basic
rustup toolchain install nightly

#Racer
rustup component add rust-src
cargo +nightly install racer

#Clippy
rustup component add clippy
