FROM odoo:12.0

USER root
RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update -y && apt-get install google-cloud-sdk -y

COPY src/odoo.conf /etc/odoo/odoo.conf
COPY src/entrypoint.sh /entrypoint.sh

USER odoo
EXPOSE 8069
ENTRYPOINT ["/entrypoint.sh"]
CMD ["odoo-start"]